import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentMethodsRecord extends FirestoreRecord {
  PaymentMethodsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "authorizationCode" field.
  String? _authorizationCode;
  String get authorizationCode => _authorizationCode ?? '';
  bool hasAuthorizationCode() => _authorizationCode != null;

  // "last4" field.
  String? _last4;
  String get last4 => _last4 ?? '';
  bool hasLast4() => _last4 != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  // "expYear" field.
  String? _expYear;
  String get expYear => _expYear ?? '';
  bool hasExpYear() => _expYear != null;

  // "cardType" field.
  String? _cardType;
  String get cardType => _cardType ?? '';
  bool hasCardType() => _cardType != null;

  // "bank" field.
  String? _bank;
  String get bank => _bank ?? '';
  bool hasBank() => _bank != null;

  // "countryCode" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  bool hasCountryCode() => _countryCode != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "lastUsedAt" field.
  DateTime? _lastUsedAt;
  DateTime? get lastUsedAt => _lastUsedAt;
  bool hasLastUsedAt() => _lastUsedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _authorizationCode = snapshotData['authorizationCode'] as String?;
    _last4 = snapshotData['last4'] as String?;
    _brand = snapshotData['brand'] as String?;
    _expYear = snapshotData['expYear'] as String?;
    _cardType = snapshotData['cardType'] as String?;
    _bank = snapshotData['bank'] as String?;
    _countryCode = snapshotData['countryCode'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _lastUsedAt = snapshotData['lastUsedAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('paymentMethods')
          : FirebaseFirestore.instance.collectionGroup('paymentMethods');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('paymentMethods').doc(id);

  static Stream<PaymentMethodsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentMethodsRecord.fromSnapshot(s));

  static Future<PaymentMethodsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentMethodsRecord.fromSnapshot(s));

  static PaymentMethodsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentMethodsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentMethodsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentMethodsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentMethodsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentMethodsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentMethodsRecordData({
  String? authorizationCode,
  String? last4,
  String? brand,
  String? expYear,
  String? cardType,
  String? bank,
  String? countryCode,
  DateTime? createdAt,
  DateTime? lastUsedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'authorizationCode': authorizationCode,
      'last4': last4,
      'brand': brand,
      'expYear': expYear,
      'cardType': cardType,
      'bank': bank,
      'countryCode': countryCode,
      'createdAt': createdAt,
      'lastUsedAt': lastUsedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentMethodsRecordDocumentEquality
    implements Equality<PaymentMethodsRecord> {
  const PaymentMethodsRecordDocumentEquality();

  @override
  bool equals(PaymentMethodsRecord? e1, PaymentMethodsRecord? e2) {
    return e1?.authorizationCode == e2?.authorizationCode &&
        e1?.last4 == e2?.last4 &&
        e1?.brand == e2?.brand &&
        e1?.expYear == e2?.expYear &&
        e1?.cardType == e2?.cardType &&
        e1?.bank == e2?.bank &&
        e1?.countryCode == e2?.countryCode &&
        e1?.createdAt == e2?.createdAt &&
        e1?.lastUsedAt == e2?.lastUsedAt;
  }

  @override
  int hash(PaymentMethodsRecord? e) => const ListEquality().hash([
        e?.authorizationCode,
        e?.last4,
        e?.brand,
        e?.expYear,
        e?.cardType,
        e?.bank,
        e?.countryCode,
        e?.createdAt,
        e?.lastUsedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentMethodsRecord;
}
