// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LuminariasStruct extends BaseStruct {
  LuminariasStruct({
    int? id,
    String? idd,
    String? tipoLampada,
    String? tipoLuminaria,
    String? potencia,
    String? fabricanteLuminaria,
  })  : _id = id,
        _idd = idd,
        _tipoLampada = tipoLampada,
        _tipoLuminaria = tipoLuminaria,
        _potencia = potencia,
        _fabricanteLuminaria = fabricanteLuminaria;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "idd" field.
  String? _idd;
  String get idd => _idd ?? '';
  set idd(String? val) => _idd = val;

  bool hasIdd() => _idd != null;

  // "tipo_lampada" field.
  String? _tipoLampada;
  String get tipoLampada => _tipoLampada ?? '';
  set tipoLampada(String? val) => _tipoLampada = val;

  bool hasTipoLampada() => _tipoLampada != null;

  // "tipo_luminaria" field.
  String? _tipoLuminaria;
  String get tipoLuminaria => _tipoLuminaria ?? '';
  set tipoLuminaria(String? val) => _tipoLuminaria = val;

  bool hasTipoLuminaria() => _tipoLuminaria != null;

  // "potencia" field.
  String? _potencia;
  String get potencia => _potencia ?? '';
  set potencia(String? val) => _potencia = val;

  bool hasPotencia() => _potencia != null;

  // "fabricante_luminaria" field.
  String? _fabricanteLuminaria;
  String get fabricanteLuminaria => _fabricanteLuminaria ?? '';
  set fabricanteLuminaria(String? val) => _fabricanteLuminaria = val;

  bool hasFabricanteLuminaria() => _fabricanteLuminaria != null;

  static LuminariasStruct fromMap(Map<String, dynamic> data) =>
      LuminariasStruct(
        id: castToType<int>(data['id']),
        idd: data['idd'] as String?,
        tipoLampada: data['tipo_lampada'] as String?,
        tipoLuminaria: data['tipo_luminaria'] as String?,
        potencia: data['potencia'] as String?,
        fabricanteLuminaria: data['fabricante_luminaria'] as String?,
      );

  static LuminariasStruct? maybeFromMap(dynamic data) => data is Map
      ? LuminariasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'idd': _idd,
        'tipo_lampada': _tipoLampada,
        'tipo_luminaria': _tipoLuminaria,
        'potencia': _potencia,
        'fabricante_luminaria': _fabricanteLuminaria,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'idd': serializeParam(
          _idd,
          ParamType.String,
        ),
        'tipo_lampada': serializeParam(
          _tipoLampada,
          ParamType.String,
        ),
        'tipo_luminaria': serializeParam(
          _tipoLuminaria,
          ParamType.String,
        ),
        'potencia': serializeParam(
          _potencia,
          ParamType.String,
        ),
        'fabricante_luminaria': serializeParam(
          _fabricanteLuminaria,
          ParamType.String,
        ),
      }.withoutNulls;

  static LuminariasStruct fromSerializableMap(Map<String, dynamic> data) =>
      LuminariasStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        idd: deserializeParam(
          data['idd'],
          ParamType.String,
          false,
        ),
        tipoLampada: deserializeParam(
          data['tipo_lampada'],
          ParamType.String,
          false,
        ),
        tipoLuminaria: deserializeParam(
          data['tipo_luminaria'],
          ParamType.String,
          false,
        ),
        potencia: deserializeParam(
          data['potencia'],
          ParamType.String,
          false,
        ),
        fabricanteLuminaria: deserializeParam(
          data['fabricante_luminaria'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LuminariasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LuminariasStruct &&
        id == other.id &&
        idd == other.idd &&
        tipoLampada == other.tipoLampada &&
        tipoLuminaria == other.tipoLuminaria &&
        potencia == other.potencia &&
        fabricanteLuminaria == other.fabricanteLuminaria;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, idd, tipoLampada, tipoLuminaria, potencia, fabricanteLuminaria]);
}

LuminariasStruct createLuminariasStruct({
  int? id,
  String? idd,
  String? tipoLampada,
  String? tipoLuminaria,
  String? potencia,
  String? fabricanteLuminaria,
}) =>
    LuminariasStruct(
      id: id,
      idd: idd,
      tipoLampada: tipoLampada,
      tipoLuminaria: tipoLuminaria,
      potencia: potencia,
      fabricanteLuminaria: fabricanteLuminaria,
    );
