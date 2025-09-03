// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsStruct extends BaseStruct {
  SettingsStruct({
    String? uid,
    int? idMunicipio,
    String? municipio,
    int? codMunicipio,
    String? url,
    String? token,
  })  : _uid = uid,
        _idMunicipio = idMunicipio,
        _municipio = municipio,
        _codMunicipio = codMunicipio,
        _url = url,
        _token = token;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "id_municipio" field.
  int? _idMunicipio;
  int get idMunicipio => _idMunicipio ?? 0;
  set idMunicipio(int? val) => _idMunicipio = val;

  void incrementIdMunicipio(int amount) => idMunicipio = idMunicipio + amount;

  bool hasIdMunicipio() => _idMunicipio != null;

  // "municipio" field.
  String? _municipio;
  String get municipio => _municipio ?? '';
  set municipio(String? val) => _municipio = val;

  bool hasMunicipio() => _municipio != null;

  // "cod_municipio" field.
  int? _codMunicipio;
  int get codMunicipio => _codMunicipio ?? 0;
  set codMunicipio(int? val) => _codMunicipio = val;

  void incrementCodMunicipio(int amount) =>
      codMunicipio = codMunicipio + amount;

  bool hasCodMunicipio() => _codMunicipio != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;

  bool hasToken() => _token != null;

  static SettingsStruct fromMap(Map<String, dynamic> data) => SettingsStruct(
        uid: data['uid'] as String?,
        idMunicipio: castToType<int>(data['id_municipio']),
        municipio: data['municipio'] as String?,
        codMunicipio: castToType<int>(data['cod_municipio']),
        url: data['url'] as String?,
        token: data['token'] as String?,
      );

  static SettingsStruct? maybeFromMap(dynamic data) =>
      data is Map ? SettingsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'uid': _uid,
        'id_municipio': _idMunicipio,
        'municipio': _municipio,
        'cod_municipio': _codMunicipio,
        'url': _url,
        'token': _token,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'id_municipio': serializeParam(
          _idMunicipio,
          ParamType.int,
        ),
        'municipio': serializeParam(
          _municipio,
          ParamType.String,
        ),
        'cod_municipio': serializeParam(
          _codMunicipio,
          ParamType.int,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
      }.withoutNulls;

  static SettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SettingsStruct(
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        idMunicipio: deserializeParam(
          data['id_municipio'],
          ParamType.int,
          false,
        ),
        municipio: deserializeParam(
          data['municipio'],
          ParamType.String,
          false,
        ),
        codMunicipio: deserializeParam(
          data['cod_municipio'],
          ParamType.int,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsStruct &&
        uid == other.uid &&
        idMunicipio == other.idMunicipio &&
        municipio == other.municipio &&
        codMunicipio == other.codMunicipio &&
        url == other.url &&
        token == other.token;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([uid, idMunicipio, municipio, codMunicipio, url, token]);
}

SettingsStruct createSettingsStruct({
  String? uid,
  int? idMunicipio,
  String? municipio,
  int? codMunicipio,
  String? url,
  String? token,
}) =>
    SettingsStruct(
      uid: uid,
      idMunicipio: idMunicipio,
      municipio: municipio,
      codMunicipio: codMunicipio,
      url: url,
      token: token,
    );
