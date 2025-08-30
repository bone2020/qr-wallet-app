import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "walletBalance" field.
  double? _walletBalance;
  double get walletBalance => _walletBalance ?? 0.0;
  bool hasWalletBalance() => _walletBalance != null;

  // "idFrontUrl" field.
  String? _idFrontUrl;
  String get idFrontUrl => _idFrontUrl ?? '';
  bool hasIdFrontUrl() => _idFrontUrl != null;

  // "idBackUrl" field.
  String? _idBackUrl;
  String get idBackUrl => _idBackUrl ?? '';
  bool hasIdBackUrl() => _idBackUrl != null;

  // "nextOfKin" field.
  String? _nextOfKin;
  String get nextOfKin => _nextOfKin ?? '';
  bool hasNextOfKin() => _nextOfKin != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "isCompany" field.
  bool? _isCompany;
  bool get isCompany => _isCompany ?? false;
  bool hasIsCompany() => _isCompany != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "companyLogoUrl" field.
  String? _companyLogoUrl;
  String get companyLogoUrl => _companyLogoUrl ?? '';
  bool hasCompanyLogoUrl() => _companyLogoUrl != null;

  // "companyMessage" field.
  String? _companyMessage;
  String get companyMessage => _companyMessage ?? '';
  bool hasCompanyMessage() => _companyMessage != null;

  // "dateOfBirth" field.
  String? _dateOfBirth;
  String get dateOfBirth => _dateOfBirth ?? '';
  bool hasDateOfBirth() => _dateOfBirth != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _email = snapshotData['email'] as String?;
    _userName = snapshotData['userName'] as String?;
    _walletBalance = castToType<double>(snapshotData['walletBalance']);
    _idFrontUrl = snapshotData['idFrontUrl'] as String?;
    _idBackUrl = snapshotData['idBackUrl'] as String?;
    _nextOfKin = snapshotData['nextOfKin'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isCompany = snapshotData['isCompany'] as bool?;
    _companyName = snapshotData['companyName'] as String?;
    _companyLogoUrl = snapshotData['companyLogoUrl'] as String?;
    _companyMessage = snapshotData['companyMessage'] as String?;
    _dateOfBirth = snapshotData['dateOfBirth'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? uid,
  String? email,
  String? userName,
  double? walletBalance,
  String? idFrontUrl,
  String? idBackUrl,
  String? nextOfKin,
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
  bool? isCompany,
  String? companyName,
  String? companyLogoUrl,
  String? companyMessage,
  String? dateOfBirth,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'email': email,
      'userName': userName,
      'walletBalance': walletBalance,
      'idFrontUrl': idFrontUrl,
      'idBackUrl': idBackUrl,
      'nextOfKin': nextOfKin,
      'display_name': displayName,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'isCompany': isCompany,
      'companyName': companyName,
      'companyLogoUrl': companyLogoUrl,
      'companyMessage': companyMessage,
      'dateOfBirth': dateOfBirth,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.email == e2?.email &&
        e1?.userName == e2?.userName &&
        e1?.walletBalance == e2?.walletBalance &&
        e1?.idFrontUrl == e2?.idFrontUrl &&
        e1?.idBackUrl == e2?.idBackUrl &&
        e1?.nextOfKin == e2?.nextOfKin &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isCompany == e2?.isCompany &&
        e1?.companyName == e2?.companyName &&
        e1?.companyLogoUrl == e2?.companyLogoUrl &&
        e1?.companyMessage == e2?.companyMessage &&
        e1?.dateOfBirth == e2?.dateOfBirth;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.email,
        e?.userName,
        e?.walletBalance,
        e?.idFrontUrl,
        e?.idBackUrl,
        e?.nextOfKin,
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.phoneNumber,
        e?.isCompany,
        e?.companyName,
        e?.companyLogoUrl,
        e?.companyMessage,
        e?.dateOfBirth
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
