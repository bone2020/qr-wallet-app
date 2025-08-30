// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TransactionDetailsStruct extends FFFirebaseStruct {
  TransactionDetailsStruct({
    String? fromUserId,
    String? toUserId,
    String? fromDisplayName,
    String? toDisplayName,
    String? paystackReference,
    String? userId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fromUserId = fromUserId,
        _toUserId = toUserId,
        _fromDisplayName = fromDisplayName,
        _toDisplayName = toDisplayName,
        _paystackReference = paystackReference,
        _userId = userId,
        super(firestoreUtilData);

  // "fromUserId" field.
  String? _fromUserId;
  String get fromUserId => _fromUserId ?? '';
  set fromUserId(String? val) => _fromUserId = val;

  bool hasFromUserId() => _fromUserId != null;

  // "toUserId" field.
  String? _toUserId;
  String get toUserId => _toUserId ?? '';
  set toUserId(String? val) => _toUserId = val;

  bool hasToUserId() => _toUserId != null;

  // "fromDisplayName" field.
  String? _fromDisplayName;
  String get fromDisplayName => _fromDisplayName ?? '';
  set fromDisplayName(String? val) => _fromDisplayName = val;

  bool hasFromDisplayName() => _fromDisplayName != null;

  // "toDisplayName" field.
  String? _toDisplayName;
  String get toDisplayName => _toDisplayName ?? '';
  set toDisplayName(String? val) => _toDisplayName = val;

  bool hasToDisplayName() => _toDisplayName != null;

  // "paystackReference" field.
  String? _paystackReference;
  String get paystackReference => _paystackReference ?? '';
  set paystackReference(String? val) => _paystackReference = val;

  bool hasPaystackReference() => _paystackReference != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  static TransactionDetailsStruct fromMap(Map<String, dynamic> data) =>
      TransactionDetailsStruct(
        fromUserId: data['fromUserId'] as String?,
        toUserId: data['toUserId'] as String?,
        fromDisplayName: data['fromDisplayName'] as String?,
        toDisplayName: data['toDisplayName'] as String?,
        paystackReference: data['paystackReference'] as String?,
        userId: data['userId'] as String?,
      );

  static TransactionDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? TransactionDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fromUserId': _fromUserId,
        'toUserId': _toUserId,
        'fromDisplayName': _fromDisplayName,
        'toDisplayName': _toDisplayName,
        'paystackReference': _paystackReference,
        'userId': _userId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fromUserId': serializeParam(
          _fromUserId,
          ParamType.String,
        ),
        'toUserId': serializeParam(
          _toUserId,
          ParamType.String,
        ),
        'fromDisplayName': serializeParam(
          _fromDisplayName,
          ParamType.String,
        ),
        'toDisplayName': serializeParam(
          _toDisplayName,
          ParamType.String,
        ),
        'paystackReference': serializeParam(
          _paystackReference,
          ParamType.String,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
      }.withoutNulls;

  static TransactionDetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TransactionDetailsStruct(
        fromUserId: deserializeParam(
          data['fromUserId'],
          ParamType.String,
          false,
        ),
        toUserId: deserializeParam(
          data['toUserId'],
          ParamType.String,
          false,
        ),
        fromDisplayName: deserializeParam(
          data['fromDisplayName'],
          ParamType.String,
          false,
        ),
        toDisplayName: deserializeParam(
          data['toDisplayName'],
          ParamType.String,
          false,
        ),
        paystackReference: deserializeParam(
          data['paystackReference'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TransactionDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TransactionDetailsStruct &&
        fromUserId == other.fromUserId &&
        toUserId == other.toUserId &&
        fromDisplayName == other.fromDisplayName &&
        toDisplayName == other.toDisplayName &&
        paystackReference == other.paystackReference &&
        userId == other.userId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        fromUserId,
        toUserId,
        fromDisplayName,
        toDisplayName,
        paystackReference,
        userId
      ]);
}

TransactionDetailsStruct createTransactionDetailsStruct({
  String? fromUserId,
  String? toUserId,
  String? fromDisplayName,
  String? toDisplayName,
  String? paystackReference,
  String? userId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TransactionDetailsStruct(
      fromUserId: fromUserId,
      toUserId: toUserId,
      fromDisplayName: fromDisplayName,
      toDisplayName: toDisplayName,
      paystackReference: paystackReference,
      userId: userId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TransactionDetailsStruct? updateTransactionDetailsStruct(
  TransactionDetailsStruct? transactionDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    transactionDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTransactionDetailsStructData(
  Map<String, dynamic> firestoreData,
  TransactionDetailsStruct? transactionDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (transactionDetails == null) {
    return;
  }
  if (transactionDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && transactionDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final transactionDetailsData =
      getTransactionDetailsFirestoreData(transactionDetails, forFieldValue);
  final nestedData =
      transactionDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      transactionDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTransactionDetailsFirestoreData(
  TransactionDetailsStruct? transactionDetails, [
  bool forFieldValue = false,
]) {
  if (transactionDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(transactionDetails.toMap());

  // Add any Firestore field values
  transactionDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTransactionDetailsListFirestoreData(
  List<TransactionDetailsStruct>? transactionDetailss,
) =>
    transactionDetailss
        ?.map((e) => getTransactionDetailsFirestoreData(e, true))
        .toList() ??
    [];
