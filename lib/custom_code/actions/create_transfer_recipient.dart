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

Future<String?> createTransferRecipient(
  String name,
  String accountNumber,
  String bankCode,
  bool saveAccount,
  String accountType,
) async {
  // Add your function code here!

  final callable =
      FirebaseFunctions.instance.httpsCallable('createTransferRecipient');

  try {
    final result = await callable.call<Map<String, dynamic>>({
      'name': name,
      'accountNumber': accountNumber,
      'bankCode': bankCode,
      'type': accountType,
      'saveAccount': saveAccount,
    });

    if (result.data['status'] == 'success') {
      return result.data['recipientCode'];
    } else {
      debugPrint('Cloud Function returned an error: ${result.data['message']}');
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
