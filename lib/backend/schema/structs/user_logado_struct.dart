// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserLogadoStruct extends BaseStruct {
  UserLogadoStruct({
    int? id,
    String? nome,
    String? email,
    int? municipio,
    String? permissoes,
    String? municipioNome,
    int? municipioID,
    int? codigoMunicipio,
  })  : _id = id,
        _nome = nome,
        _email = email,
        _municipio = municipio,
        _permissoes = permissoes,
        _municipioNome = municipioNome,
        _municipioID = municipioID,
        _codigoMunicipio = codigoMunicipio;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "municipio" field.
  int? _municipio;
  int get municipio => _municipio ?? 0;
  set municipio(int? val) => _municipio = val;

  void incrementMunicipio(int amount) => municipio = municipio + amount;

  bool hasMunicipio() => _municipio != null;

  // "permissoes" field.
  String? _permissoes;
  String get permissoes => _permissoes ?? '';
  set permissoes(String? val) => _permissoes = val;

  bool hasPermissoes() => _permissoes != null;

  // "municipioNome" field.
  String? _municipioNome;
  String get municipioNome => _municipioNome ?? '';
  set municipioNome(String? val) => _municipioNome = val;

  bool hasMunicipioNome() => _municipioNome != null;

  // "municipioID" field.
  int? _municipioID;
  int get municipioID => _municipioID ?? 0;
  set municipioID(int? val) => _municipioID = val;

  void incrementMunicipioID(int amount) => municipioID = municipioID + amount;

  bool hasMunicipioID() => _municipioID != null;

  // "codigoMunicipio" field.
  int? _codigoMunicipio;
  int get codigoMunicipio => _codigoMunicipio ?? 0;
  set codigoMunicipio(int? val) => _codigoMunicipio = val;

  void incrementCodigoMunicipio(int amount) =>
      codigoMunicipio = codigoMunicipio + amount;

  bool hasCodigoMunicipio() => _codigoMunicipio != null;

  static UserLogadoStruct fromMap(Map<String, dynamic> data) =>
      UserLogadoStruct(
        id: castToType<int>(data['id']),
        nome: data['nome'] as String?,
        email: data['email'] as String?,
        municipio: castToType<int>(data['municipio']),
        permissoes: data['permissoes'] as String?,
        municipioNome: data['municipioNome'] as String?,
        municipioID: castToType<int>(data['municipioID']),
        codigoMunicipio: castToType<int>(data['codigoMunicipio']),
      );

  static UserLogadoStruct? maybeFromMap(dynamic data) => data is Map
      ? UserLogadoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nome': _nome,
        'email': _email,
        'municipio': _municipio,
        'permissoes': _permissoes,
        'municipioNome': _municipioNome,
        'municipioID': _municipioID,
        'codigoMunicipio': _codigoMunicipio,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'municipio': serializeParam(
          _municipio,
          ParamType.int,
        ),
        'permissoes': serializeParam(
          _permissoes,
          ParamType.String,
        ),
        'municipioNome': serializeParam(
          _municipioNome,
          ParamType.String,
        ),
        'municipioID': serializeParam(
          _municipioID,
          ParamType.int,
        ),
        'codigoMunicipio': serializeParam(
          _codigoMunicipio,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserLogadoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserLogadoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        municipio: deserializeParam(
          data['municipio'],
          ParamType.int,
          false,
        ),
        permissoes: deserializeParam(
          data['permissoes'],
          ParamType.String,
          false,
        ),
        municipioNome: deserializeParam(
          data['municipioNome'],
          ParamType.String,
          false,
        ),
        municipioID: deserializeParam(
          data['municipioID'],
          ParamType.int,
          false,
        ),
        codigoMunicipio: deserializeParam(
          data['codigoMunicipio'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserLogadoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserLogadoStruct &&
        id == other.id &&
        nome == other.nome &&
        email == other.email &&
        municipio == other.municipio &&
        permissoes == other.permissoes &&
        municipioNome == other.municipioNome &&
        municipioID == other.municipioID &&
        codigoMunicipio == other.codigoMunicipio;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        nome,
        email,
        municipio,
        permissoes,
        municipioNome,
        municipioID,
        codigoMunicipio
      ]);
}

UserLogadoStruct createUserLogadoStruct({
  int? id,
  String? nome,
  String? email,
  int? municipio,
  String? permissoes,
  String? municipioNome,
  int? municipioID,
  int? codigoMunicipio,
}) =>
    UserLogadoStruct(
      id: id,
      nome: nome,
      email: email,
      municipio: municipio,
      permissoes: permissoes,
      municipioNome: municipioNome,
      municipioID: municipioID,
      codigoMunicipio: codigoMunicipio,
    );
