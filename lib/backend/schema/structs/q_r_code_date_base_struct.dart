// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class QRCodeDateBaseStruct extends FFFirebaseStruct {
  QRCodeDateBaseStruct({
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
    String? userName,
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
        _userName = userName,
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

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  static QRCodeDateBaseStruct fromMap(Map<String, dynamic> data) =>
      QRCodeDateBaseStruct(
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
        userName: data['userName'] as String?,
      );

  static QRCodeDateBaseStruct? maybeFromMap(dynamic data) => data is Map
      ? QRCodeDateBaseStruct.fromMap(data.cast<String, dynamic>())
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
        'userName': _userName,
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
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
      }.withoutNulls;

  static QRCodeDateBaseStruct fromSerializableMap(Map<String, dynamic> data) =>
      QRCodeDateBaseStruct(
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
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QRCodeDateBaseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QRCodeDateBaseStruct &&
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
        companyMessage == other.companyMessage &&
        userName == other.userName;
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
        companyMessage,
        userName
      ]);
}

QRCodeDateBaseStruct createQRCodeDateBaseStruct({
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
  String? userName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QRCodeDateBaseStruct(
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
      userName: userName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QRCodeDateBaseStruct? updateQRCodeDateBaseStruct(
  QRCodeDateBaseStruct? qRCodeDateBase, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    qRCodeDateBase
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQRCodeDateBaseStructData(
  Map<String, dynamic> firestoreData,
  QRCodeDateBaseStruct? qRCodeDateBase,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (qRCodeDateBase == null) {
    return;
  }
  if (qRCodeDateBase.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && qRCodeDateBase.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final qRCodeDateBaseData =
      getQRCodeDateBaseFirestoreData(qRCodeDateBase, forFieldValue);
  final nestedData =
      qRCodeDateBaseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = qRCodeDateBase.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQRCodeDateBaseFirestoreData(
  QRCodeDateBaseStruct? qRCodeDateBase, [
  bool forFieldValue = false,
]) {
  if (qRCodeDateBase == null) {
    return {};
  }
  final firestoreData = mapToFirestore(qRCodeDateBase.toMap());

  // Add any Firestore field values
  qRCodeDateBase.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQRCodeDateBaseListFirestoreData(
  List<QRCodeDateBaseStruct>? qRCodeDateBases,
) =>
    qRCodeDateBases
        ?.map((e) => getQRCodeDateBaseFirestoreData(e, true))
        .toList() ??
    [];
