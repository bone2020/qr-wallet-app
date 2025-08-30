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
import 'package:flutter/foundation.dart';

Future<String?> initiateWithdrawal(
  double amount,
  String recipientCode,
  String? reason,
) async {
  // Add your function code here!

  final functions = FirebaseFunctions.instance;
  final callable = functions.httpsCallable('initiateWithdrawal');

  try {
    final result = await callable.call<Map<String, dynamic>>({
      'amount': amount,
      'recipientCode': recipientCode,
      'reason': reason ?? 'Wallet Withdrawal',
    });

    if (result.data['status'] == 'pending') {
      return result.data['transactionId'];
    } else {
      debugPrint(
          'Withdrawal initiation returned an unexpected status: ${result.data}');
      return null;
    }
  } on FirebaseFunctionsException catch (e) {
    debugPrint('Cloud Function Exception: ${e.code} - ${e.message}');
    return null;
  } catch (e) {
    debugPrint('An unexpected error occurred: $e');
    return null;
  }
}
