// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_functions/cloud_functions.dart';

Future<String?> performWithdrawal(
  String? accountName,
  String? accountNumber,
  String? bankCode,
  String? amountStr,
) async {
  // Add your function code here!

  // --- Input Validation ---
  if (accountName == null || accountName.isEmpty) {
    return 'Account name cannot be empty.';
  }
  if (accountNumber == null || accountNumber.isEmpty) {
    return 'Account number cannot be empty.';
  }
  if (bankCode == null || bankCode.isEmpty) {
    return 'Please select a bank.';
  }
  if (amountStr == null || amountStr.isEmpty) {
    return 'Amount cannot be empty.';
  }

  final double? amount = double.tryParse(amountStr);
  if (amount == null || amount <= 0) {
    return 'Please enter a valid amount.';
  }
  // --- End Input Validation ---

  final functions = FirebaseFunctions.instance;

  try {
    // Step 1: Call the createTransferRecipient function
    final createRecipientCallable =
        functions.httpsCallable('createTransferRecipient');
    final createRecipientResult =
        await createRecipientCallable.call<Map<String, dynamic>>({
      'name': accountName,
      'accountNumber': accountNumber,
      'bankCode': bankCode,
    });

    // Extract the recipientCode from the successful response
    final recipientCode =
        createRecipientResult.data['recipientCode'] as String?;

    if (recipientCode == null || recipientCode.isEmpty) {
      // This is a safety check in case the backend succeeds but doesn't return a code.
      return 'Failed to get a valid recipient code from the server.';
    }

    // Step 2: If recipient creation was successful, call initiateWithdrawal
    final initiateWithdrawalCallable =
        functions.httpsCallable('initiateWithdrawal');
    await initiateWithdrawalCallable.call<Map<String, dynamic>>({
      'amount': amount,
      'recipientCode': recipientCode,
      'reason': 'Wallet Withdrawal',
    });

    // If both functions succeed, return null (which means no error message)
    return null;
  } on FirebaseFunctionsException catch (e) {
    // This will catch errors from either of the Cloud Function calls
    print('Cloud Function Error: ${e.code} - ${e.message}');
    return e.message ?? 'An unknown error occurred.';
  } catch (e) {
    // This will catch any other unexpected errors
    print('An unexpected error occurred: $e');
    return 'An unexpected error occurred. Please try again.';
  }
}
