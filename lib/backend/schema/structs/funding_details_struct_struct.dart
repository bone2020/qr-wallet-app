// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FundingDetailsStructStruct extends FFFirebaseStruct {
  FundingDetailsStructStruct({
    String? servicesProviderName,
    String? moMoName,
    String? moMoNumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _servicesProviderName = servicesProviderName,
        _moMoName = moMoName,
        _moMoNumber = moMoNumber,
        super(firestoreUtilData);

  // "servicesProviderName" field.
  String? _servicesProviderName;
  String get servicesProviderName => _servicesProviderName ?? '';
  set servicesProviderName(String? val) => _servicesProviderName = val;

  bool hasServicesProviderName() => _servicesProviderName != null;

  // "moMoName" field.
  String? _moMoName;
  String get moMoName => _moMoName ?? '';
  set moMoName(String? val) => _moMoName = val;

  bool hasMoMoName() => _moMoName != null;

  // "moMoNumber" field.
  String? _moMoNumber;
  String get moMoNumber => _moMoNumber ?? '';
  set moMoNumber(String? val) => _moMoNumber = val;

  bool hasMoMoNumber() => _moMoNumber != null;

  static FundingDetailsStructStruct fromMap(Map<String, dynamic> data) =>
      FundingDetailsStructStruct(
        servicesProviderName: data['servicesProviderName'] as String?,
        moMoName: data['moMoName'] as String?,
        moMoNumber: data['moMoNumber'] as String?,
      );

  static FundingDetailsStructStruct? maybeFromMap(dynamic data) => data is Map
      ? FundingDetailsStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'servicesProviderName': _servicesProviderName,
        'moMoName': _moMoName,
        'moMoNumber': _moMoNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'servicesProviderName': serializeParam(
          _servicesProviderName,
          ParamType.String,
        ),
        'moMoName': serializeParam(
          _moMoName,
          ParamType.String,
        ),
        'moMoNumber': serializeParam(
          _moMoNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static FundingDetailsStructStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FundingDetailsStructStruct(
        servicesProviderName: deserializeParam(
          data['servicesProviderName'],
          ParamType.String,
          false,
        ),
        moMoName: deserializeParam(
          data['moMoName'],
          ParamType.String,
          false,
        ),
        moMoNumber: deserializeParam(
          data['moMoNumber'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FundingDetailsStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FundingDetailsStructStruct &&
        servicesProviderName == other.servicesProviderName &&
        moMoName == other.moMoName &&
        moMoNumber == other.moMoNumber;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([servicesProviderName, moMoName, moMoNumber]);
}

FundingDetailsStructStruct createFundingDetailsStructStruct({
  String? servicesProviderName,
  String? moMoName,
  String? moMoNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FundingDetailsStructStruct(
      servicesProviderName: servicesProviderName,
      moMoName: moMoName,
      moMoNumber: moMoNumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FundingDetailsStructStruct? updateFundingDetailsStructStruct(
  FundingDetailsStructStruct? fundingDetailsStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fundingDetailsStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFundingDetailsStructStructData(
  Map<String, dynamic> firestoreData,
  FundingDetailsStructStruct? fundingDetailsStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fundingDetailsStruct == null) {
    return;
  }
  if (fundingDetailsStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fundingDetailsStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fundingDetailsStructData =
      getFundingDetailsStructFirestoreData(fundingDetailsStruct, forFieldValue);
  final nestedData =
      fundingDetailsStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      fundingDetailsStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFundingDetailsStructFirestoreData(
  FundingDetailsStructStruct? fundingDetailsStruct, [
  bool forFieldValue = false,
]) {
  if (fundingDetailsStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fundingDetailsStruct.toMap());

  // Add any Firestore field values
  fundingDetailsStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFundingDetailsStructListFirestoreData(
  List<FundingDetailsStructStruct>? fundingDetailsStructs,
) =>
    fundingDetailsStructs
        ?.map((e) => getFundingDetailsStructFirestoreData(e, true))
        .toList() ??
    [];
