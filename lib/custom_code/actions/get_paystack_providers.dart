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

Future<List<ProviderStructStruct>> getPaystackProviders() async {
  // Add your function code here!

  final functions = FirebaseFunctions.instance;
  final callable = functions.httpsCallable('getPaystackProviders');

  try {
    final result = await callable.call<Map<String, dynamic>>();
    final providerData = result.data['providers'] as List<dynamic>? ?? [];

    return providerData.map((data) {
      final map = Map<String, dynamic>.from(data as Map);
      return ProviderStructStruct(
        name: map['name'] ?? '',
        code: map['code'] ?? '',
        type: map['type'] ?? '',
      );
    }).toList();
  } catch (e) {
    debugPrint('Error fetching Paystack providers: $e');
    return [];
  }
}
