import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SavedAccountDetilesRecord extends FirestoreRecord {
  SavedAccountDetilesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "bankName" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  // "accountNumber" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  bool hasAccountNumber() => _accountNumber != null;

  // "accountHolderName" field.
  String? _accountHolderName;
  String get accountHolderName => _accountHolderName ?? '';
  bool hasAccountHolderName() => _accountHolderName != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as String?;
    _bankName = snapshotData['bankName'] as String?;
    _accountNumber = snapshotData['accountNumber'] as String?;
    _accountHolderName = snapshotData['accountHolderName'] as String?;
    _dateTime = snapshotData['dateTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SavedAccountDetiles');

  static Stream<SavedAccountDetilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SavedAccountDetilesRecord.fromSnapshot(s));

  static Future<SavedAccountDetilesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SavedAccountDetilesRecord.fromSnapshot(s));

  static SavedAccountDetilesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SavedAccountDetilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SavedAccountDetilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SavedAccountDetilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SavedAccountDetilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SavedAccountDetilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSavedAccountDetilesRecordData({
  String? userID,
  String? bankName,
  String? accountNumber,
  String? accountHolderName,
  DateTime? dateTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'bankName': bankName,
      'accountNumber': accountNumber,
      'accountHolderName': accountHolderName,
      'dateTime': dateTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class SavedAccountDetilesRecordDocumentEquality
    implements Equality<SavedAccountDetilesRecord> {
  const SavedAccountDetilesRecordDocumentEquality();

  @override
  bool equals(SavedAccountDetilesRecord? e1, SavedAccountDetilesRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.bankName == e2?.bankName &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.accountHolderName == e2?.accountHolderName &&
        e1?.dateTime == e2?.dateTime;
  }

  @override
  int hash(SavedAccountDetilesRecord? e) => const ListEquality().hash([
        e?.userID,
        e?.bankName,
        e?.accountNumber,
        e?.accountHolderName,
        e?.dateTime
      ]);

  @override
  bool isValidKey(Object? o) => o is SavedAccountDetilesRecord;
}
