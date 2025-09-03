// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CampoMunicipioStruct extends BaseStruct {
  CampoMunicipioStruct({
    String? municipio,
    int? codigo,
  })  : _municipio = municipio,
        _codigo = codigo;

  // "municipio" field.
  String? _municipio;
  String get municipio => _municipio ?? '';
  set municipio(String? val) => _municipio = val;

  bool hasMunicipio() => _municipio != null;

  // "codigo" field.
  int? _codigo;
  int get codigo => _codigo ?? 0;
  set codigo(int? val) => _codigo = val;

  void incrementCodigo(int amount) => codigo = codigo + amount;

  bool hasCodigo() => _codigo != null;

  static CampoMunicipioStruct fromMap(Map<String, dynamic> data) =>
      CampoMunicipioStruct(
        municipio: data['municipio'] as String?,
        codigo: castToType<int>(data['codigo']),
      );

  static CampoMunicipioStruct? maybeFromMap(dynamic data) => data is Map
      ? CampoMunicipioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'municipio': _municipio,
        'codigo': _codigo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'municipio': serializeParam(
          _municipio,
          ParamType.String,
        ),
        'codigo': serializeParam(
          _codigo,
          ParamType.int,
        ),
      }.withoutNulls;

  static CampoMunicipioStruct fromSerializableMap(Map<String, dynamic> data) =>
      CampoMunicipioStruct(
        municipio: deserializeParam(
          data['municipio'],
          ParamType.String,
          false,
        ),
        codigo: deserializeParam(
          data['codigo'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CampoMunicipioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CampoMunicipioStruct &&
        municipio == other.municipio &&
        codigo == other.codigo;
  }

  @override
  int get hashCode => const ListEquality().hash([municipio, codigo]);
}

CampoMunicipioStruct createCampoMunicipioStruct({
  String? municipio,
  int? codigo,
}) =>
    CampoMunicipioStruct(
      municipio: municipio,
      codigo: codigo,
    );
