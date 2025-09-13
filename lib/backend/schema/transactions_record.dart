import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "transactionId" field.
  String? _transactionId;
  String get transactionId => _transactionId ?? '';
  bool hasTransactionId() => _transactionId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "details" field.
  TransactionDetailsStruct? _details;
  TransactionDetailsStruct get details =>
      _details ?? TransactionDetailsStruct();
  bool hasDetails() => _details != null;

  void _initializeFields() {
    _transactionId = snapshotData['transactionId'] as String?;
    _type = snapshotData['type'] as String?;
    _status = snapshotData['status'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _details = snapshotData['details'] is TransactionDetailsStruct
        ? snapshotData['details']
        : TransactionDetailsStruct.maybeFromMap(snapshotData['details']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  String? transactionId,
  String? type,
  String? status,
  double? amount,
  DateTime? timestamp,
  String? description,
  TransactionDetailsStruct? details,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'transactionId': transactionId,
      'type': type,
      'status': status,
      'amount': amount,
      'timestamp': timestamp,
      'description': description,
      'details': TransactionDetailsStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "details" field.
  addTransactionDetailsStructData(firestoreData, details, 'details');

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.transactionId == e2?.transactionId &&
        e1?.type == e2?.type &&
        e1?.status == e2?.status &&
        e1?.amount == e2?.amount &&
        e1?.timestamp == e2?.timestamp &&
        e1?.description == e2?.description &&
        e1?.details == e2?.details;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.transactionId,
        e?.type,
        e?.status,
        e?.amount,
        e?.timestamp,
        e?.description,
        e?.details
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
