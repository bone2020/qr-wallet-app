// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProviderStructStruct extends FFFirebaseStruct {
  ProviderStructStruct({
    String? name,
    String? code,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _code = code,
        _type = type,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  static ProviderStructStruct fromMap(Map<String, dynamic> data) =>
      ProviderStructStruct(
        name: data['name'] as String?,
        code: data['code'] as String?,
        type: data['type'] as String?,
      );

  static ProviderStructStruct? maybeFromMap(dynamic data) => data is Map
      ? ProviderStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'code': _code,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProviderStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProviderStructStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProviderStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProviderStructStruct &&
        name == other.name &&
        code == other.code &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([name, code, type]);
}

ProviderStructStruct createProviderStructStruct({
  String? name,
  String? code,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProviderStructStruct(
      name: name,
      code: code,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProviderStructStruct? updateProviderStructStruct(
  ProviderStructStruct? providerStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    providerStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProviderStructStructData(
  Map<String, dynamic> firestoreData,
  ProviderStructStruct? providerStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (providerStruct == null) {
    return;
  }
  if (providerStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && providerStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final providerStructData =
      getProviderStructFirestoreData(providerStruct, forFieldValue);
  final nestedData =
      providerStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = providerStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProviderStructFirestoreData(
  ProviderStructStruct? providerStruct, [
  bool forFieldValue = false,
]) {
  if (providerStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(providerStruct.toMap());

  // Add any Firestore field values
  providerStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProviderStructListFirestoreData(
  List<ProviderStructStruct>? providerStructs,
) =>
    providerStructs
        ?.map((e) => getProviderStructFirestoreData(e, true))
        .toList() ??
    [];
