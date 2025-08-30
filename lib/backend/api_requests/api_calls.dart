import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Paystack Group Code

class PaystackGroup {
  static String getBaseUrl() =>
      'https://us-central1-qr-wallet-app-y4cu3z-2021.cloudfunctions.net/paystack';
  static Map<String, String> headers = {};
  static InitializeTransactionCall initializeTransactionCall =
      InitializeTransactionCall();
}

class InitializeTransactionCall {
  Future<ApiCallResponse> call({
    double? amount,
    String? email = '',
    String? userId = '',
    String? channel = '',
  }) async {
    final baseUrl = PaystackGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "amount": ${amount},
  "email": "${escapeStringForJson(email)}",
  "metadata": {
    "userId": "${escapeStringForJson(userId)}"
  },
  "channel": "${escapeStringForJson(channel)}"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'initializeTransaction',
      apiUrl: '${baseUrl}/initialize-transaction',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Paystack Group Code

/// Start PaystackPublicAPI Group Code

class PaystackPublicAPIGroup {
  static String getBaseUrl() => 'https://api.paystack.co';
  static Map<String, String> headers = {
    'Authorization': 'Bearer  sk_test_a5d5b376b470ceabd388aea915744bed5bd0f36b',
  };
  static ListBanksCall listBanksCall = ListBanksCall();
}

class ListBanksCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PaystackPublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listBanks',
      apiUrl: '${baseUrl}/bank',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer  sk_test_a5d5b376b470ceabd388aea915744bed5bd0f36b',
      },
      params: {
        'country': "GH",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic bankName(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
      );
  dynamic bankCode(dynamic response) => getJsonField(
        response,
        r'''$.data[:].code''',
      );
}

/// End PaystackPublicAPI Group Code

/// Start Firebase Functions Group Code

class FirebaseFunctionsGroup {
  static String getBaseUrl() => 'https:/';
  static Map<String, String> headers = {};
  static InternalTransferCall internalTransferCall = InternalTransferCall();
}

class InternalTransferCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = FirebaseFunctionsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'internalTransfer',
      apiUrl: '${baseUrl}/internaltransfer-jznc6my6oa-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Firebase Functions Group Code

class CreateTransferRecipientCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? accountNumber = '',
    String? bankCode = '',
    String? type = '',
    bool? saveAccount,
  }) async {
    final ffApiRequestBody = '''
{
  "name": "<string>",
  "accountNumber": "<string>",
  "bankCode": "<string>",
  "type": "<string>",
   "saveAccount": true
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'createTransferRecipient',
      apiUrl:
          'https://us-central1-qr-wallet-app-y4cu3z-2021.cloudfunctions.net/createTransferRecipient',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
