// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TransactionStruct extends FFFirebaseStruct {
  TransactionStruct({
    String? transactionID,
    String? buyerID,
    String? sellerID,
    double? amount,
    String? buyersDisplayName,
    String? sellersDisplayName,
    String? itemOrPurpose,
    DateTime? timeStamp,
    String? status,
    String? companyName,
    String? companyLog,
    String? companyMessage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _transactionID = transactionID,
        _buyerID = buyerID,
        _sellerID = sellerID,
        _amount = amount,
        _buyersDisplayName = buyersDisplayName,
        _sellersDisplayName = sellersDisplayName,
        _itemOrPurpose = itemOrPurpose,
        _timeStamp = timeStamp,
        _status = status,
        _companyName = companyName,
        _companyLog = companyLog,
        _companyMessage = companyMessage,
        super(firestoreUtilData);

  // "transactionID" field.
  String? _transactionID;
  String get transactionID => _transactionID ?? '';
  set transactionID(String? val) => _transactionID = val;

  bool hasTransactionID() => _transactionID != null;

  // "buyerID" field.
  String? _buyerID;
  String get buyerID => _buyerID ?? '';
  set buyerID(String? val) => _buyerID = val;

  bool hasBuyerID() => _buyerID != null;

  // "sellerID" field.
  String? _sellerID;
  String get sellerID => _sellerID ?? '';
  set sellerID(String? val) => _sellerID = val;

  bool hasSellerID() => _sellerID != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "buyersDisplayName" field.
  String? _buyersDisplayName;
  String get buyersDisplayName => _buyersDisplayName ?? '';
  set buyersDisplayName(String? val) => _buyersDisplayName = val;

  bool hasBuyersDisplayName() => _buyersDisplayName != null;

  // "sellersDisplayName" field.
  String? _sellersDisplayName;
  String get sellersDisplayName => _sellersDisplayName ?? '';
  set sellersDisplayName(String? val) => _sellersDisplayName = val;

  bool hasSellersDisplayName() => _sellersDisplayName != null;

  // "itemOrPurpose" field.
  String? _itemOrPurpose;
  String get itemOrPurpose => _itemOrPurpose ?? '';
  set itemOrPurpose(String? val) => _itemOrPurpose = val;

  bool hasItemOrPurpose() => _itemOrPurpose != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  set timeStamp(DateTime? val) => _timeStamp = val;

  bool hasTimeStamp() => _timeStamp != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;

  bool hasCompanyName() => _companyName != null;

  // "companyLog" field.
  String? _companyLog;
  String get companyLog => _companyLog ?? '';
  set companyLog(String? val) => _companyLog = val;

  bool hasCompanyLog() => _companyLog != null;

  // "companyMessage" field.
  String? _companyMessage;
  String get companyMessage => _companyMessage ?? '';
  set companyMessage(String? val) => _companyMessage = val;

  bool hasCompanyMessage() => _companyMessage != null;

  static TransactionStruct fromMap(Map<String, dynamic> data) =>
      TransactionStruct(
        transactionID: data['transactionID'] as String?,
        buyerID: data['buyerID'] as String?,
        sellerID: data['sellerID'] as String?,
        amount: castToType<double>(data['amount']),
        buyersDisplayName: data['buyersDisplayName'] as String?,
        sellersDisplayName: data['sellersDisplayName'] as String?,
        itemOrPurpose: data['itemOrPurpose'] as String?,
        timeStamp: data['timeStamp'] as DateTime?,
        status: data['status'] as String?,
        companyName: data['companyName'] as String?,
        companyLog: data['companyLog'] as String?,
        companyMessage: data['companyMessage'] as String?,
      );

  static TransactionStruct? maybeFromMap(dynamic data) => data is Map
      ? TransactionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'transactionID': _transactionID,
        'buyerID': _buyerID,
        'sellerID': _sellerID,
        'amount': _amount,
        'buyersDisplayName': _buyersDisplayName,
        'sellersDisplayName': _sellersDisplayName,
        'itemOrPurpose': _itemOrPurpose,
        'timeStamp': _timeStamp,
        'status': _status,
        'companyName': _companyName,
        'companyLog': _companyLog,
        'companyMessage': _companyMessage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'transactionID': serializeParam(
          _transactionID,
          ParamType.String,
        ),
        'buyerID': serializeParam(
          _buyerID,
          ParamType.String,
        ),
        'sellerID': serializeParam(
          _sellerID,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'buyersDisplayName': serializeParam(
          _buyersDisplayName,
          ParamType.String,
        ),
        'sellersDisplayName': serializeParam(
          _sellersDisplayName,
          ParamType.String,
        ),
        'itemOrPurpose': serializeParam(
          _itemOrPurpose,
          ParamType.String,
        ),
        'timeStamp': serializeParam(
          _timeStamp,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'companyName': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'companyLog': serializeParam(
          _companyLog,
          ParamType.String,
        ),
        'companyMessage': serializeParam(
          _companyMessage,
          ParamType.String,
        ),
      }.withoutNulls;

  static TransactionStruct fromSerializableMap(Map<String, dynamic> data) =>
      TransactionStruct(
        transactionID: deserializeParam(
          data['transactionID'],
          ParamType.String,
          false,
        ),
        buyerID: deserializeParam(
          data['buyerID'],
          ParamType.String,
          false,
        ),
        sellerID: deserializeParam(
          data['sellerID'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        buyersDisplayName: deserializeParam(
          data['buyersDisplayName'],
          ParamType.String,
          false,
        ),
        sellersDisplayName: deserializeParam(
          data['sellersDisplayName'],
          ParamType.String,
          false,
        ),
        itemOrPurpose: deserializeParam(
          data['itemOrPurpose'],
          ParamType.String,
          false,
        ),
        timeStamp: deserializeParam(
          data['timeStamp'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        companyName: deserializeParam(
          data['companyName'],
          ParamType.String,
          false,
        ),
        companyLog: deserializeParam(
          data['companyLog'],
          ParamType.String,
          false,
        ),
        companyMessage: deserializeParam(
          data['companyMessage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TransactionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TransactionStruct &&
        transactionID == other.transactionID &&
        buyerID == other.buyerID &&
        sellerID == other.sellerID &&
        amount == other.amount &&
        buyersDisplayName == other.buyersDisplayName &&
        sellersDisplayName == other.sellersDisplayName &&
        itemOrPurpose == other.itemOrPurpose &&
        timeStamp == other.timeStamp &&
        status == other.status &&
        companyName == other.companyName &&
        companyLog == other.companyLog &&
        companyMessage == other.companyMessage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        transactionID,
        buyerID,
        sellerID,
        amount,
        buyersDisplayName,
        sellersDisplayName,
        itemOrPurpose,
        timeStamp,
        status,
        companyName,
        companyLog,
        companyMessage
      ]);
}

TransactionStruct createTransactionStruct({
  String? transactionID,
  String? buyerID,
  String? sellerID,
  double? amount,
  String? buyersDisplayName,
  String? sellersDisplayName,
  String? itemOrPurpose,
  DateTime? timeStamp,
  String? status,
  String? companyName,
  String? companyLog,
  String? companyMessage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TransactionStruct(
      transactionID: transactionID,
      buyerID: buyerID,
      sellerID: sellerID,
      amount: amount,
      buyersDisplayName: buyersDisplayName,
      sellersDisplayName: sellersDisplayName,
      itemOrPurpose: itemOrPurpose,
      timeStamp: timeStamp,
      status: status,
      companyName: companyName,
      companyLog: companyLog,
      companyMessage: companyMessage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TransactionStruct? updateTransactionStruct(
  TransactionStruct? transaction, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    transaction
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTransactionStructData(
  Map<String, dynamic> firestoreData,
  TransactionStruct? transaction,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (transaction == null) {
    return;
  }
  if (transaction.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && transaction.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final transactionData =
      getTransactionFirestoreData(transaction, forFieldValue);
  final nestedData =
      transactionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = transaction.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTransactionFirestoreData(
  TransactionStruct? transaction, [
  bool forFieldValue = false,
]) {
  if (transaction == null) {
    return {};
  }
  final firestoreData = mapToFirestore(transaction.toMap());

  // Add any Firestore field values
  transaction.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTransactionListFirestoreData(
  List<TransactionStruct>? transactions,
) =>
    transactions?.map((e) => getTransactionFirestoreData(e, true)).toList() ??
    [];
