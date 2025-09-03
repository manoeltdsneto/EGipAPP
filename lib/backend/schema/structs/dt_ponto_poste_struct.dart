// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtPontoPosteStruct extends BaseStruct {
  DtPontoPosteStruct({
    String? nome,
    String? descricao,
    double? latitude,
    double? longitude,
    LatLng? location,
  })  : _nome = nome,
        _descricao = descricao,
        _latitude = latitude,
        _longitude = longitude,
        _location = location;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;

  bool hasDescricao() => _descricao != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;

  void incrementLatitude(double amount) => latitude = latitude + amount;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;

  void incrementLongitude(double amount) => longitude = longitude + amount;

  bool hasLongitude() => _longitude != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;

  bool hasLocation() => _location != null;

  static DtPontoPosteStruct fromMap(Map<String, dynamic> data) =>
      DtPontoPosteStruct(
        nome: data['nome'] as String?,
        descricao: data['descricao'] as String?,
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
        location: data['location'] as LatLng?,
      );

  static DtPontoPosteStruct? maybeFromMap(dynamic data) => data is Map
      ? DtPontoPosteStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'descricao': _descricao,
        'latitude': _latitude,
        'longitude': _longitude,
        'location': _location,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static DtPontoPosteStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtPontoPosteStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'DtPontoPosteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtPontoPosteStruct &&
        nome == other.nome &&
        descricao == other.descricao &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        location == other.location;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([nome, descricao, latitude, longitude, location]);
}

DtPontoPosteStruct createDtPontoPosteStruct({
  String? nome,
  String? descricao,
  double? latitude,
  double? longitude,
  LatLng? location,
}) =>
    DtPontoPosteStruct(
      nome: nome,
      descricao: descricao,
      latitude: latitude,
      longitude: longitude,
      location: location,
    );
