import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_wallet_app_y4cu3z/flutter_flow/custom_functions.dart'; // Correct import for FlutterFlow actions

// A simple model for a saved account, created from a Firestore document.
class SavedAccount {
  final String id;
  final String recipientCode;
  final String accountHolderName;
  final String bankName;
  final String accountNumberLast4;
  final String accountType;

  SavedAccount({
    required this.id,
    required this.recipientCode,
    required this.accountHolderName,
    required this.bankName,
    required this.accountNumberLast4,
    required this.accountType,
  });

  factory SavedAccount.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return SavedAccount(
      id: doc.id,
      recipientCode: data['paystackRecipientCode'] ?? '',
      accountHolderName: data['accountHolderName'] ?? 'N/A',
      bankName: data['bankName'] ?? 'N/A',
      accountNumberLast4: data['accountNumberLast4'] ?? '0000',
      accountType: data['accountType'] ?? 'ghipss',
    );
  }
}

class WithdrawalScreenWidget extends StatefulWidget {
  const WithdrawalScreenWidget({super.key});

  @override
  State<WithdrawalScreenWidget> createState() => _WithdrawalScreenWidgetState();
}

class _WithdrawalScreenWidgetState extends State<WithdrawalScreenWidget> {
  final _amountController = TextEditingController();
  SavedAccount? _selectedAccount;
  bool _isLoading = false;

  // Get the current user to fetch their accounts
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<void> _initiateWithdrawal() async {
    if (_selectedAccount == null) {
      _showError('Please select an account to withdraw to.');
      return;
    }
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      _showError('Please enter a valid amount.');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final transactionId = await actions.initiateWithdrawal(
        amount,
        _selectedAccount!.recipientCode,
        'Wallet Withdrawal',
      );

      if (transactionId != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Withdrawal initiated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        // Optionally, navigate away or clear the form
        _amountController.clear();
        setState(() => _selectedAccount = null);
      } else {
        throw Exception('Withdrawal failed. Your wallet has been refunded.');
      }
    } catch (e) {
      _showError(e.toString().replaceFirst('Exception: ', ''));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showError(String message) {
    // In case the error comes from a FirebaseFunctionsException, it might have
    // a more complex structure. This is a simple way to make it more readable.
    final displayMessage = message.contains('message:')
        ? message.split('message:').last.trim()
        : message;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(displayMessage), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser == null) {
      return const Center(child: Text('Please log in to see your accounts.'));
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select an Account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(currentUser!.uid)
                .collection('withdrawalAccounts')
                .orderBy('createdAt', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error loading accounts: ${snapshot.error}'),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('No saved accounts found.'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // In FlutterFlow, you would add a "Navigate" action here
                          // to go to your 'AddBankAccountPage'.
                          print('Navigate to Add Account Screen');
                        },
                        child: const Text('Add a New Account'),
                      ),
                    ],
                  ),
                );
              }

              final accounts = snapshot.data!.docs
                  .map((doc) => SavedAccount.fromFirestore(doc))
                  .toList();

              return DropdownButtonFormField<SavedAccount>(
                value: _selectedAccount,
                hint: const Text('Choose a payout account'),
                isExpanded: true,
                items: accounts.map((account) {
                  return DropdownMenuItem(
                    value: account,
                    child: Row(
                      children: [
                        Icon(
                          account.accountType == 'mobile_money'
                              ? Icons.phone_android
                              : Icons.account_balance,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${account.bankName} - **** ${account.accountNumberLast4}',
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedAccount = value),
                validator: (value) =>
                    value == null ? 'Please select an account' : null,
              );
            },
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _amountController,
            decoration: const InputDecoration(
              labelText: 'Amount to Withdraw (GHS)',
              prefixText: '₵ ',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 32),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _initiateWithdrawal,
                    child: const Text('Withdraw Funds'),
                  ),
                ),
        ],
      ),
    );
  }
}
