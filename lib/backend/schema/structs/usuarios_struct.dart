// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsuariosStruct extends BaseStruct {
  UsuariosStruct({
    int? id,
    String? nome,
    String? email,
    int? municipio,
    String? permissoes,
    String? senha,
  })  : _id = id,
        _nome = nome,
        _email = email,
        _municipio = municipio,
        _permissoes = permissoes,
        _senha = senha;

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

  // "senha" field.
  String? _senha;
  String get senha => _senha ?? '';
  set senha(String? val) => _senha = val;

  bool hasSenha() => _senha != null;

  static UsuariosStruct fromMap(Map<String, dynamic> data) => UsuariosStruct(
        id: castToType<int>(data['id']),
        nome: data['nome'] as String?,
        email: data['email'] as String?,
        municipio: castToType<int>(data['municipio']),
        permissoes: data['permissoes'] as String?,
        senha: data['senha'] as String?,
      );

  static UsuariosStruct? maybeFromMap(dynamic data) =>
      data is Map ? UsuariosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nome': _nome,
        'email': _email,
        'municipio': _municipio,
        'permissoes': _permissoes,
        'senha': _senha,
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
        'senha': serializeParam(
          _senha,
          ParamType.String,
        ),
      }.withoutNulls;

  static UsuariosStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsuariosStruct(
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
        senha: deserializeParam(
          data['senha'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UsuariosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsuariosStruct &&
        id == other.id &&
        nome == other.nome &&
        email == other.email &&
        municipio == other.municipio &&
        permissoes == other.permissoes &&
        senha == other.senha;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, nome, email, municipio, permissoes, senha]);
}

UsuariosStruct createUsuariosStruct({
  int? id,
  String? nome,
  String? email,
  int? municipio,
  String? permissoes,
  String? senha,
}) =>
    UsuariosStruct(
      id: id,
      nome: nome,
      email: email,
      municipio: municipio,
      permissoes: permissoes,
      senha: senha,
    );
