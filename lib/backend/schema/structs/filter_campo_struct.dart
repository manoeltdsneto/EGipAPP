// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterCampoStruct extends BaseStruct {
  FilterCampoStruct({
    String? idd,
    String? idPonto,
    String? municipio,
    String? endereco,
    String? bairro,
    String? localizacao,
  })  : _idd = idd,
        _idPonto = idPonto,
        _municipio = municipio,
        _endereco = endereco,
        _bairro = bairro,
        _localizacao = localizacao;

  // "idd" field.
  String? _idd;
  String get idd => _idd ?? '';
  set idd(String? val) => _idd = val;

  bool hasIdd() => _idd != null;

  // "idPonto" field.
  String? _idPonto;
  String get idPonto => _idPonto ?? '';
  set idPonto(String? val) => _idPonto = val;

  bool hasIdPonto() => _idPonto != null;

  // "municipio" field.
  String? _municipio;
  String get municipio => _municipio ?? '';
  set municipio(String? val) => _municipio = val;

  bool hasMunicipio() => _municipio != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  set endereco(String? val) => _endereco = val;

  bool hasEndereco() => _endereco != null;

  // "bairro" field.
  String? _bairro;
  String get bairro => _bairro ?? '';
  set bairro(String? val) => _bairro = val;

  bool hasBairro() => _bairro != null;

  // "localizacao" field.
  String? _localizacao;
  String get localizacao => _localizacao ?? '';
  set localizacao(String? val) => _localizacao = val;

  bool hasLocalizacao() => _localizacao != null;

  static FilterCampoStruct fromMap(Map<String, dynamic> data) =>
      FilterCampoStruct(
        idd: data['idd'] as String?,
        idPonto: data['idPonto'] as String?,
        municipio: data['municipio'] as String?,
        endereco: data['endereco'] as String?,
        bairro: data['bairro'] as String?,
        localizacao: data['localizacao'] as String?,
      );

  static FilterCampoStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterCampoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'idd': _idd,
        'idPonto': _idPonto,
        'municipio': _municipio,
        'endereco': _endereco,
        'bairro': _bairro,
        'localizacao': _localizacao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'idd': serializeParam(
          _idd,
          ParamType.String,
        ),
        'idPonto': serializeParam(
          _idPonto,
          ParamType.String,
        ),
        'municipio': serializeParam(
          _municipio,
          ParamType.String,
        ),
        'endereco': serializeParam(
          _endereco,
          ParamType.String,
        ),
        'bairro': serializeParam(
          _bairro,
          ParamType.String,
        ),
        'localizacao': serializeParam(
          _localizacao,
          ParamType.String,
        ),
      }.withoutNulls;

  static FilterCampoStruct fromSerializableMap(Map<String, dynamic> data) =>
      FilterCampoStruct(
        idd: deserializeParam(
          data['idd'],
          ParamType.String,
          false,
        ),
        idPonto: deserializeParam(
          data['idPonto'],
          ParamType.String,
          false,
        ),
        municipio: deserializeParam(
          data['municipio'],
          ParamType.String,
          false,
        ),
        endereco: deserializeParam(
          data['endereco'],
          ParamType.String,
          false,
        ),
        bairro: deserializeParam(
          data['bairro'],
          ParamType.String,
          false,
        ),
        localizacao: deserializeParam(
          data['localizacao'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FilterCampoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FilterCampoStruct &&
        idd == other.idd &&
        idPonto == other.idPonto &&
        municipio == other.municipio &&
        endereco == other.endereco &&
        bairro == other.bairro &&
        localizacao == other.localizacao;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([idd, idPonto, municipio, endereco, bairro, localizacao]);
}

FilterCampoStruct createFilterCampoStruct({
  String? idd,
  String? idPonto,
  String? municipio,
  String? endereco,
  String? bairro,
  String? localizacao,
}) =>
    FilterCampoStruct(
      idd: idd,
      idPonto: idPonto,
      municipio: municipio,
      endereco: endereco,
      bairro: bairro,
      localizacao: localizacao,
    );
