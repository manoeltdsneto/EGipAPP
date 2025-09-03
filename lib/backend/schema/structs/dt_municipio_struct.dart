// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtMunicipioStruct extends BaseStruct {
  DtMunicipioStruct({
    int? id,
    String? municipio,
    String? codIbge,
    String? status,
  })  : _id = id,
        _municipio = municipio,
        _codIbge = codIbge,
        _status = status;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "municipio" field.
  String? _municipio;
  String get municipio => _municipio ?? '';
  set municipio(String? val) => _municipio = val;

  bool hasMunicipio() => _municipio != null;

  // "cod_ibge" field.
  String? _codIbge;
  String get codIbge => _codIbge ?? '';
  set codIbge(String? val) => _codIbge = val;

  bool hasCodIbge() => _codIbge != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static DtMunicipioStruct fromMap(Map<String, dynamic> data) =>
      DtMunicipioStruct(
        id: castToType<int>(data['id']),
        municipio: data['municipio'] as String?,
        codIbge: data['cod_ibge'] as String?,
        status: data['status'] as String?,
      );

  static DtMunicipioStruct? maybeFromMap(dynamic data) => data is Map
      ? DtMunicipioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'municipio': _municipio,
        'cod_ibge': _codIbge,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'municipio': serializeParam(
          _municipio,
          ParamType.String,
        ),
        'cod_ibge': serializeParam(
          _codIbge,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtMunicipioStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtMunicipioStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        municipio: deserializeParam(
          data['municipio'],
          ParamType.String,
          false,
        ),
        codIbge: deserializeParam(
          data['cod_ibge'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtMunicipioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtMunicipioStruct &&
        id == other.id &&
        municipio == other.municipio &&
        codIbge == other.codIbge &&
        status == other.status;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, municipio, codIbge, status]);
}

DtMunicipioStruct createDtMunicipioStruct({
  int? id,
  String? municipio,
  String? codIbge,
  String? status,
}) =>
    DtMunicipioStruct(
      id: id,
      municipio: municipio,
      codIbge: codIbge,
      status: status,
    );
