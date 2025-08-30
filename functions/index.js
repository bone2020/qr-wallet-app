const { onCall, onRequest, HttpsError } = require("firebase-functions/v2/https");
const functions = require("firebase-functions"); // v1 used for auth triggers
const admin = require("firebase-admin");
const axios = require('axios');
const crypto = require('crypto');
const express = require('express');
const cors = require('cors');




const paystackSecretKey = process.env.PAYSTACK_SECRET_KEY;

admin.initializeApp();
const db = admin.firestore();

// Define constants for transaction types and statuses
const TRANSACTION_TYPES = {
    DEPOSIT: 'DEPOSIT',
    WITHDRAWAL: 'WITHDRAWAL',
    P2P: 'P2P',
};

const TRANSACTION_STATUSES = {
    PENDING: 'PENDING',
    COMPLETED: 'COMPLETED',
    FAILED: 'FAILED',
    REVERSED: 'REVERSED',
};

// =================================================================
//  Express App for Public Paystack APIs (Initialization & Webhook)
// =================================================================
const paystackApp = express();
paystackApp.use(express.json());
paystackApp.use(express.urlencoded({ extended: true }));
paystackApp.use(cors({ origin: true }));

/**
 * Initialize a Paystack transaction for funding a user's wallet.
 */
paystackApp.post('/initialize-transaction', async(req, res) => {
    const { amount, email, currency = 'GHS', metadata, channel } = req.body;

    if (!amount || !email || !(metadata && metadata.userId)) {
        return res.status(400).json({
            status: false,
            message: 'Amount, email, and metadata.userId are required.',
        });
    }

    try {
        const payload = {
            amount: Math.round(amount * 100),
            email,
            currency,
            metadata: { user_id: metadata.userId },
        };
        // If a specific channel is provided (e.g., 'mobile_money' or 'bank'), add it to the payload.
        // Paystack will prioritize this payment method on the checkout page.
        if (channel) {
            payload.channels = [channel];
        }

        const response = await axios.post(
            'https://api.paystack.co/transaction/initialize',
            payload, { headers: { Authorization: `Bearer ${paystackSecretKey}` } }
        );

        const paystackData = response.data.data;

        const transactionRef = db.collection('transactions').doc(paystackData.reference);
        await transactionRef.set({
            transactionId: paystackData.reference,
            type: TRANSACTION_TYPES.DEPOSIT,
            status: TRANSACTION_STATUSES.PENDING,
            amount: amount,
            timestamp: admin.firestore.FieldValue.serverTimestamp(),
            details: {
                userId: metadata.userId,
                paystackReference: paystackData.reference,
                description: 'Wallet deposit initiated',
            },
        });

        res.status(200).json(response.data);
    } catch (error) {
        const isPaystackError = !!error.response;
        const errorMessage = (isPaystackError && error.response.data && error.response.data.message) ||
            'An error occurred while trying to initialize the payment. Please try again.';
        const errorDetails = isPaystackError ? error.response.data : { message: error.message };
        console.error('❌ Paystack Init Error:', JSON.stringify(errorDetails, null, 2));

        res.status(500).json({
            status: false,
            message: errorMessage,
        });
    }
});

const verifyPaystackSignature = (req, res, next) => {
    const signature = req.headers['x-paystack-signature'];
    if (!signature) {
        console.warn('Webhook received without signature.');
        return res.status(401).json({ status: 'error', message: 'Missing signature.' });
    }

    try {
        const hash = crypto.createHmac('sha512', paystackSecretKey)
            .update(JSON.stringify(req.body))
            .digest('hex');

        const trusted = Buffer.from(hash, 'hex');
        const untrusted = Buffer.from(signature, 'hex');
        if (trusted.length !== untrusted.length || !crypto.timingSafeEqual(trusted, untrusted)) {
            console.warn('Webhook received with invalid signature.');
            return res.status(401).json({ status: 'error', message: 'Invalid signature.' });
        }
    } catch (e) {
        console.error('Webhook Error: Could not process request for signature validation.', e);
        return res.status(400).json({ status: 'error', message: 'Invalid request body.' });
    }
    return next();
};

/**
 * Paystack Webhook
 */
paystackApp.post('/webhook', verifyPaystackSignature, async(req, res) => {
    const event = req.body;
    console.log('Webhook event received:', event.event);

    try {
        switch (event.event) {
            case 'charge.success':
                await _handleChargeSuccess(event.data);
                break;
            case 'transfer.success':
            case 'transfer.failed':
            case 'transfer.reversed':
                await _handleTransferUpdate(event.data);
                break;
            default:
                console.log(`Webhook received unhandled event: ${event.event}`);
        }
        res.status(200).json({ status: 'received', message: 'Webhook acknowledged.' });
    } catch (error) {
        console.error(`Webhook processing failed for event ${event.event}:`, error);
        res.status(500).json({ status: 'error', message: 'Internal webhook processing error.' });
    }
});

exports.chargeSavedPaymentMethod = onCall({ memory: '256MB' }, async(request) => {
    if (!request.auth) {
        throw new HttpsError('unauthenticated', 'You must be logged in.');
    }

    const { amount, authorizationCode, email } = request.data;
    const userId = request.auth.uid;

    _validateAmount(amount);
    if (typeof authorizationCode !== 'string' || authorizationCode.trim() === '') {
        throw new HttpsError('invalid-argument', 'A valid authorization code is required.');
    }
    if (typeof email !== 'string' || email.trim() === '') {
        throw new HttpsError('invalid-argument', 'A valid email is required.');
    }

    try {
        const payload = {
            amount: Math.round(amount * 100),
            email,
            authorization_code: authorizationCode,
        };

        const response = await axios.post(
            'https://api.paystack.co/transaction/charge_authorization',
            payload, { headers: { Authorization: `Bearer ${paystackSecretKey}` } }
        );

        const paystackData = response.data.data;

        // Create a pending transaction record. The webhook will complete it.
        const transactionRef = db.collection('transactions').doc(paystackData.reference);
        await transactionRef.set({
            transactionId: paystackData.reference,
            type: TRANSACTION_TYPES.DEPOSIT,
            status: TRANSACTION_STATUSES.PENDING,
            amount: amount,
            timestamp: admin.firestore.FieldValue.serverTimestamp(),
            details: {
                userId: userId,
                paystackReference: paystackData.reference,
                description: 'Wallet deposit via saved card',
                authorizationCode: authorizationCode,
            },
        });

        return { status: 'success', message: 'Payment initiated. Awaiting confirmation.', reference: paystackData.reference };
    } catch (error) {
        const isPaystackError = !!error.response;
        const errorMessage = (isPaystackError && error.response.data && error.response.data.message) || 'Failed to charge saved card.';
        const errorDetails = isPaystackError ? error.response.data : { message: error.message };

        console.error('❌ Paystack Charge Authorization Error:', JSON.stringify(errorDetails, null, 2));
        throw new HttpsError('internal', errorMessage, errorDetails);
    }
});
/**
 * Handles charge.success
 */
async function _handleChargeSuccess(data) {
    const { reference, amount, metadata } = data;
    const userId = metadata && metadata.user_id;

    if (!userId) {
        throw new Error(`charge.success event missing user_id in metadata for reference ${reference}.`);
    }

    const userRef = db.collection('users').doc(userId);
    const transactionRef = db.collection('transactions').doc(reference);

    await db.runTransaction(async(t) => {
        const [transactionDoc, userDoc] = await t.getAll(transactionRef, userRef);

        if (!transactionDoc.exists || transactionDoc.data().status !== TRANSACTION_STATUSES.PENDING) {
            console.log(`Transaction ${reference} already processed or not pending.`);
            return;
        }

        if (!userDoc.exists) {
            console.error(`User ${userId} not found for transaction ${reference}. Cannot update balance.`);
            // Mark transaction as complete but log the error for manual review.
            t.update(transactionRef, {
                status: TRANSACTION_STATUSES.COMPLETED,
                'details.error': 'User profile not found during wallet update.',
            });
            return;
        }

        t.update(userRef, { walletBalance: admin.firestore.FieldValue.increment(amount / 100) });
        t.update(transactionRef, {
            status: TRANSACTION_STATUSES.COMPLETED,
            'details.description': 'Wallet deposit via Paystack'
        });
    });
    console.log(`✅ Successfully funded wallet for user ${userId} with ${amount / 100}.`);

    // Handle saving reusable payment methods (cards)
    if (data.authorization && data.authorization.reusable) {
        const authorization = data.authorization;
        const paymentMethodRef = userRef.collection('paymentMethods').doc(authorization.authorization_code);
        try {
            const doc = await paymentMethodRef.get();

            if (doc.exists) {
                // If the card is already saved, just update the last used timestamp.
                await paymentMethodRef.update({ lastUsedAt: admin.firestore.FieldValue.serverTimestamp() });
                console.log(`✅ Updated lastUsedAt for existing payment method for user ${userId}: ${authorization.last4}.`);
            } else {
                // If it's a new card, create the full document.
                await paymentMethodRef.set({
                    authorizationCode: authorization.authorization_code,
                    bin: authorization.bin,
                    last4: authorization.last4,
                    expMonth: authorization.exp_month,
                    expYear: authorization.exp_year,
                    cardType: authorization.card_type,
                    bank: authorization.bank,
                    countryCode: authorization.country_code,
                    brand: authorization.brand,
                    createdAt: admin.firestore.FieldValue.serverTimestamp(),
                    lastUsedAt: admin.firestore.FieldValue.serverTimestamp(),
                });
                console.log(`✅ Saved new reusable payment method for user ${userId}: ${authorization.last4}.`);
            }
        } catch (saveError) {
            console.error(`❌ Failed to save payment method for user ${userId}:`, saveError);
        }
    }
}

/**
 * Handles transfer updates
 */
async function _handleTransferUpdate(data) {
    const { reference, status, failure_reason } = data;

    const statusMap = {
        success: TRANSACTION_STATUSES.COMPLETED,
        failed: TRANSACTION_STATUSES.FAILED,
        reversed: TRANSACTION_STATUSES.REVERSED,
    };

    const newStatus = statusMap[status];
    if (!newStatus) {
        console.warn(`Unhandled transfer status '${status}' for reference ${reference}.`);
        return;
    }

    await db.runTransaction(async(t) => {
        const transactionRef = db.collection('transactions').doc(reference);
        const transactionDoc = await t.get(transactionRef);

        if (!transactionDoc.exists) {
            console.log(`Transaction ${reference} not found for webhook update.`);
            return;
        }

        const updateData = {
            status: newStatus,
            'details.webhookReceivedAt': admin.firestore.FieldValue.serverTimestamp()
        };
        if (failure_reason) updateData['details.failureReason'] = failure_reason;
        t.update(transactionRef, updateData);

        const originalStatus = transactionDoc.data().status;
        if (
            (newStatus === TRANSACTION_STATUSES.FAILED || newStatus === TRANSACTION_STATUSES.REVERSED) &&
            originalStatus === TRANSACTION_STATUSES.PENDING
        ) {
            const { amount, details } = transactionDoc.data();
            if (details && details.userId) {
                const userRef = db.collection('users').doc(details.userId);
                const userDoc = await t.get(userRef);
                if (userDoc.exists) {
                    t.update(userRef, { walletBalance: admin.firestore.FieldValue.increment(amount) });
                    console.log(`✅ Refunded ${amount} to user ${details.userId} for failed transfer ${reference}.`);
                } else {
                    updateData['details.refundError'] = `User ${details.userId} not found for refund.`;
                }
            }
        }
    });
    console.log(`✅ Updated withdrawal transaction ${reference} to ${newStatus}.`);
}

// Export Express app
exports.paystack = onRequest({ memory: '256MB' }, paystackApp);

// =================================================================
//  Callable Functions
// =================================================================

exports.internalTransfer = onCall({ memory: '256MB' }, async(request) => {
    if (!request.auth) {
        throw new HttpsError('unauthenticated', 'You must be logged in to make a transfer.');
    }
    const { receiverId, amount, description } = request.data;
    const senderId = request.auth.uid;

    if (typeof receiverId !== 'string' || receiverId.trim() === '') {
        throw new HttpsError('invalid-argument', 'A valid receiver ID is required.');
    }
    _validateAmount(amount);
    if (senderId === receiverId) {
        throw new HttpsError('invalid-argument', 'You cannot send money to yourself.');
    }

    const senderRef = db.collection('users').doc(senderId);
    const receiverRef = db.collection('users').doc(receiverId);
    const transactionRef = db.collection('transactions').doc();

    let recipientName;
    try {
        recipientName = await db.runTransaction(async(t) => {
            const [senderDoc, receiverDoc] = await t.getAll(senderRef, receiverRef);
            if (!senderDoc.exists || !receiverDoc.exists) {
                throw new HttpsError('not-found', 'Sender or receiver not found.');
            }

            const senderData = senderDoc.data();
            const receiverData = receiverDoc.data();
            const senderBalance = senderData.walletBalance || 0;

            if (senderBalance < amount) {
                throw new HttpsError('failed-precondition', 'Insufficient funds.');
            }

            t.update(senderRef, { walletBalance: admin.firestore.FieldValue.increment(-amount) });
            t.update(receiverRef, { walletBalance: admin.firestore.FieldValue.increment(amount) });

            const transactionDetails = _createP2PTransactionDetails(senderId, receiverId, senderData, receiverData);

            t.set(transactionRef, {
                transactionId: transactionRef.id,
                type: TRANSACTION_TYPES.P2P,
                amount,
                status: TRANSACTION_STATUSES.COMPLETED,
                timestamp: admin.firestore.FieldValue.serverTimestamp(),
                description: description || 'Internal Transfer',
                details: transactionDetails,
            });

            return receiverData.displayName || 'N/A';
        });
    } catch (error) {
        console.error(`Internal transfer failed for ${senderId} -> ${receiverId}`, error);
        if (error.code) throw error;
        throw new HttpsError('internal', 'An error occurred during the transfer.', error.message);
    }

    return {
        status: 'success',
        message: `Successfully transferred ${amount} to ${recipientName || 'the recipient'}.`,
        transactionId: transactionRef.id,
        recipientName,
        amountTransferred: amount,
    };
});

exports.createTransferRecipient = onCall({ memory: '256MB' }, async(request) => {
    if (!request.auth) {
        throw new HttpsError('unauthenticated', 'You must be logged in.');
    }

    const { name, accountNumber, bankCode, type, saveAccount = false } = request.data;

    const requiredFields = { name, accountNumber, bankCode, type };
    for (const [field, value] of Object.entries(requiredFields)) {
        if (typeof value !== 'string' || value.trim() === '') {
            throw new HttpsError('invalid-argument', `The field '${field}' is required and must be a non-empty string.`);
        }
    }

    const userId = request.auth.uid;
    const accountsCollection = db.collection('users').doc(userId).collection('withdrawalAccounts');
    const last4 = accountNumber.slice(-4);

    try {
        const existingAccountQuery = await accountsCollection
            .where('accountNumberLast4', '==', last4)
            .where('bankCode', '==', bankCode)
            .limit(1)
            .get();

        if (!existingAccountQuery.empty) {
            const existingAccount = existingAccountQuery.docs[0].data();
            // If the account already exists, update a timestamp to show it was recently verified.
            await existingAccountQuery.docs[0].ref.update({
                lastVerifiedAt: admin.firestore.FieldValue.serverTimestamp(),
            });
            return {
                status: 'success',
                message: 'This account is already saved.',
                recipientCode: existingAccount.paystackRecipientCode,
            };
        }

        const response = await axios.post(
            'https://api.paystack.co/transferrecipient', {
                type,
                name,
                account_number: accountNumber,
                bank_code: bankCode,
                currency: 'GHS',
            }, { headers: { Authorization: `Bearer ${paystackSecretKey}` } }
        );

        const recipientData = response.data.data;
        const recipientCode = recipientData.recipient_code;
        let message = 'Recipient created successfully.';

        if (saveAccount) {
            const accountRef = accountsCollection.doc();
            await accountRef.set({
                paystackRecipientCode: recipientCode,
                accountHolderName: name,
                bankName: recipientData.details.bank_name,
                accountNumberLast4: last4,
                bankCode,
                accountType: type,
                createdAt: admin.firestore.FieldValue.serverTimestamp(),
            });
            message = 'Recipient created and saved successfully.';
        }

        return { status: 'success', message, recipientCode };
    } catch (error) {
        const isPaystackError = !!error.response;
        const errorMessage =
            (isPaystackError && error.response.data && error.response.data.message) ||
            'Failed to create transfer recipient.';
        const errorDetails = isPaystackError ? error.response.data : { message: error.message };

        console.error('❌ Paystack Create Recipient API failed:', JSON.stringify(errorDetails, null, 2));

        if (isPaystackError && error.response.status >= 400 && error.response.status < 500) {
            throw new HttpsError('invalid-argument', errorMessage, errorDetails);
        }
        throw new HttpsError('internal', 'An error occurred with the payment provider.', errorDetails);
    }
});

// A simple in-memory cache for the provider list to avoid hitting the API on every request.
let providerCache = {
    data: null,
    timestamp: 0,
};
const CACHE_DURATION_MS = 6 * 60 * 60 * 1000; // 6 hours

exports.getPaystackProviders = onCall({ memory: '128MB' }, async(request) => {
    const now = Date.now();
    if (providerCache.data && (now - providerCache.timestamp < CACHE_DURATION_MS)) {
        console.log('✅ Returning cached provider list.');
        return { providers: providerCache.data };
    }

    try {
        let allProviders = [];
        let nextUrl = 'https://api.paystack.co/bank?country=ghana&use_cursor=true&perPage=100';

        while (nextUrl) {
            const response = await axios.get(nextUrl, {
                headers: { Authorization: `Bearer ${paystackSecretKey}` },
            });

            const pageData = response.data.data || [];
            const providers = pageData.map(provider => ({
                name: provider.name,
                code: provider.code,
                type: provider.type,
            }));

            allProviders = allProviders.concat(providers);

            // Check for the next page cursor
            const meta = response.data.meta;
            nextUrl = meta && meta.next_page ? meta.next_page : null;
        }

        const providers = allProviders;

        // Update cache
        providerCache = {
            data: providers,
            timestamp: now,
        };

        console.log(`✅ Fetched and cached ${providers.length} providers from Paystack.`);
        return { providers };

    } catch (error) {
        const isPaystackError = !!error.response;
        const errorMessage = (isPaystackError && error.response.data && error.response.data.message) || 'Failed to fetch provider list.';
        const errorDetails = isPaystackError ? error.response.data : { message: error.message };

        console.error('❌ Paystack Get Banks API failed:', JSON.stringify(errorDetails, null, 2));
        throw new HttpsError('internal', 'Could not retrieve provider list.', errorDetails);
    }
});





exports.initiateWithdrawal = onCall({ memory: '256MB' }, async(request) => {
    if (!request.auth) throw new HttpsError('unauthenticated', 'You must be logged in.');

    const { amount, recipientCode, reason } = request.data;
    const userId = request.auth.uid;
    const withdrawalReason = reason || 'Wallet Withdrawal';

    _validateAmount(amount);
    if (typeof recipientCode !== 'string' || recipientCode.trim() === '') {
        throw new HttpsError('invalid-argument', 'A valid recipient code is required.');
    }

    const userRef = db.collection('users').doc(userId);
    const transactionRef = db.collection('transactions').doc();
    const transferReference = transactionRef.id;

    try {
        await db.runTransaction(async(t) => {
            const userDoc = await t.get(userRef);
            if (!userDoc.exists) throw new HttpsError('not-found', 'User profile not found.');

            const userBalance = userDoc.data().walletBalance || 0;
            if (userBalance < amount) throw new HttpsError('failed-precondition', 'Insufficient funds.');

            t.update(userRef, { walletBalance: admin.firestore.FieldValue.increment(-amount) });
            t.set(transactionRef, {
                transactionId: transferReference,
                type: TRANSACTION_TYPES.WITHDRAWAL,
                status: TRANSACTION_STATUSES.PENDING,
                amount,
                timestamp: admin.firestore.FieldValue.serverTimestamp(),
                details: {
                    userId,
                    paystackReference: transferReference,
                    description: withdrawalReason,
                    recipientCode,
                },
            });
        });
    } catch (error) {
        console.error(`Withdrawal failed during pre-flight check for user ${userId}:`, error);
        if (error.code) throw error;
        throw new HttpsError('internal', 'Could not prepare withdrawal.', error.message);
    }

    try {
        await axios.post(
            'https://api.paystack.co/transfer', {
                source: 'balance',
                reason: withdrawalReason,
                amount: Math.round(amount * 100),
                recipient: recipientCode,
                reference: transferReference,
            }, { headers: { Authorization: `Bearer ${paystackSecretKey}` } }
        );

        return {
            status: 'pending',
            message: 'Withdrawal initiated. It may take a few moments to complete.',
            transactionId: transferReference,
        };
    } catch (error) {
        const errorMessage = (error.response && error.response.data && error.response.data.message) || 'Withdrawal failed to initiate.';
        await _handleFailedWithdrawal(userRef, transactionRef, amount, errorMessage);
        throw new HttpsError('internal', 'Could not initiate withdrawal. Your wallet has been refunded.', { reason: errorMessage });
    }
});

async function _handleFailedWithdrawal(userRef, transactionRef, amount, errorMessage) {
    try {
        await db.runTransaction(async(t) => {
            t.update(userRef, { walletBalance: admin.firestore.FieldValue.increment(amount) });
            t.update(transactionRef, {
                status: TRANSACTION_STATUSES.FAILED,
                'details.failureReason': errorMessage,
            });
        });
        console.log(`✅ Refunded user ${userRef.id} for failed withdrawal.`);
    } catch (refundError) {
        console.error(`CRITICAL refund failure for user ${userRef.id}`, { withdrawalTxId: transactionRef.id, originalError: errorMessage, refundError });
    }
}

const generateDisplayNameFromEmail = (email) => {
    if (!email) return 'New User';
    const namePart = email.split('@')[0].trim();
    if (!namePart) return 'New User';
    return namePart.split(/[\.\-_]+/)
        .filter(Boolean)
        .map(part => part.charAt(0).toUpperCase() + part.slice(1))
        .join(' ') || 'New User';
};

// =================================================================
//  Helper Functions
// =================================================================

function _validateAmount(amount) {
    if (typeof amount !== 'number' || !isFinite(amount) || amount <= 0) {
        throw new HttpsError('invalid-argument', 'A positive numeric amount is required.');
    }
    if (Math.round(amount * 100) / 100 !== amount) {
        throw new HttpsError('invalid-argument', 'Amount cannot have more than two decimal places.');
    }
}

function _createP2PTransactionDetails(senderId, receiverId, senderData, receiverData) {
    const details = {
        fromUserId: senderId,
        toUserId: receiverId,
        fromDisplayName: senderData.displayName || 'N/A',
        toDisplayName: receiverData.displayName || 'N/A',
    };
    if (senderData.isCompany) {
        details.fromCompanyName = senderData.companyName || 'N/A';
    }
    if (receiverData.isCompany) {
        details.toCompanyName = receiverData.companyName || 'N/A';
        details.toCompanyLogoUrl = receiverData.companyLogoUrl || null;
        details.toCompanyMessage = receiverData.companyMessage || '';
    }
    return details;
}
// // Create user profile on signup
exports.createUserProfile = functions.auth.user().onCreate(async(user) => {
    const { uid, email, displayName } = user;
    const userRef = db.collection('users').doc(uid);

    const profileData = {
        email: email || '',
        displayName: displayName || generateDisplayNameFromEmail(email),
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        walletBalance: 0,
        isCompany: false,
    };

    try {
        await userRef.create(profileData);
        console.log(`✅ Successfully created profile for new user: ${uid}`);
    } catch (error) {
        if (error.code === 'ALREADY_EXISTS') {
            console.log(`Profile for user ${uid} already exists. Skipping creation.`);
        } else {
            console.error(`❌ Error creating profile for user ${uid}:`, error);
            throw error;
        }
    }
});

// Cleanup when user is deleted
exports.onUserDeleted = functions.auth.user().onDelete(async(user) => {
    const userId = user.uid;

    try {
        // 1. Delete user profile document
        await db.collection('users').doc(userId).delete();

        // 2. Anonymize transactions
        const primaryTransactionsQuery = db.collection('transactions')
            .where('details.userId', '==', userId)
            .get();
        const sentTransactionsQuery = db.collection('transactions')
            .where('details.fromUserId', '==', userId)
            .get();
        const receivedTransactionsQuery = db.collection('transactions')
            .where('details.toUserId', '==', userId)
            .get();

        const [primarySnap, sentSnap, receivedSnap] = await Promise.all([
            primaryTransactionsQuery,
            sentTransactionsQuery,
            receivedTransactionsQuery,
        ]);

        const batch = db.batch();
        const processedIds = new Set();

        const processSnapshot = (snapshot, role) => {
            snapshot.forEach(doc => {
                if (processedIds.has(doc.id)) return;
                const updateData = { 'details.deletedAt': admin.firestore.FieldValue.serverTimestamp() };
                updateData[`details.${role}`] = 'deleted-user';
                batch.update(doc.ref, updateData);
                processedIds.add(doc.id);
            });
        };

        processSnapshot(primarySnap, 'userId');
        processSnapshot(sentSnap, 'fromUserId');
        processSnapshot(receivedSnap, 'toUserId');

        await batch.commit();

        console.log(`✅ Cleaned up profile for deleted user ${userId}, transactions anonymized.`);
    } catch (error) {
        console.error(`❌ Cleanup failed for user ${userId}:`, error);
    }
});