const admin = require("firebase-admin/app");
admin.initializeApp();

const createTransferRecipient = require("./create_transfer_recipient.js");
exports.createTransferRecipient =
  createTransferRecipient.createTransferRecipient;
const nitiateWithdrawal = require("./nitiate_withdrawal.js");
exports.nitiateWithdrawal = nitiateWithdrawal.nitiateWithdrawal;
