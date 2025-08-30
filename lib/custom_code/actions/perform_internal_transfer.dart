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

Future<String?> performInternalTransfer(
  String? recipientId,
  String? amountStr,
) async {
  // Add your function code here!
  // --- Input Validation ---
  if (recipientId == null || recipientId.isEmpty) {
    return 'Recipient ID cannot be empty.';
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
  final transferCallable = functions.httpsCallable('internalTransfer');

  try {
    await transferCallable.call<Map<String, dynamic>>({
      'receiverId': recipientId,
      'amount': amount,
      'description': 'P2P Transfer',
    });

    // If the function succeeds, return null (no error)
    return null;
  } on FirebaseFunctionsException catch (e) {
    // Return the specific error message from the Cloud Function
    // e.g., "Insufficient funds." or "You cannot send money to yourself."
    print('Cloud Function Error: ${e.code} - ${e.message}');
    return e.message ?? 'An unknown error occurred during the transfer.';
  } catch (e) {
    // Catch any other unexpected errors
    print('An unexpected error occurred: $e');
    return 'An unexpected client-side error occurred.';
  }
}
