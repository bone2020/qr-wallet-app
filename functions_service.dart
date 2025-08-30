import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

class FunctionsService {
  // Singleton
  FunctionsService._();
  static final FunctionsService instance = FunctionsService._();

  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  /// Common helper
  Future<Map<String, dynamic>> _callFunction(
    String name,
    Map<String, dynamic> params,
  ) async {
    try {
      final result = await _functions.httpsCallable(name).call(params);
      return Map<String, dynamic>.from(result.data);
    } on FirebaseFunctionsException catch (e) {
      debugPrint('Cloud Function Error ($name): ${e.code} - ${e.message}');
      throw e;
    }
  }

  /// Internal transfer
  Future<Map<String, dynamic>> internalTransfer({
    required String receiverId,
    required double amount,
    String? description,
  }) async {
    return _callFunction('internalTransfer', {
      'receiverId': receiverId,
      'amount': amount,
      'description': description ?? 'Sent you money',
    });
  }

  /// Create transfer recipient
  Future<Map<String, dynamic>> createTransferRecipient({
    required String name,
    required String accountNumber,
    required String bankCode,
    required String type,
    bool saveAccount = false,
  }) async {
    return _callFunction('createTransferRecipient', {
      'name': name,
      'accountNumber': accountNumber,
      'bankCode': bankCode,
      'type': type,
      'saveAccount': saveAccount,
    });
  }

  /// Initiate withdrawal
  Future<Map<String, dynamic>> initiateWithdrawal({
    required double amount,
    required String recipientCode,
    String? reason,
  }) async {
    return _callFunction('initiateWithdrawal', {
      'amount': amount,
      'recipientCode': recipientCode,
      'reason': reason,
    });
  }
}
