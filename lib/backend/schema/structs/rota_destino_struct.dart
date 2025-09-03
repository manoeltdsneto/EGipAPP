// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RotaDestinoStruct extends BaseStruct {
  RotaDestinoStruct({
    String? latitude,
    String? longitude,
  })  : _latitude = latitude,
        _longitude = longitude;

  // "latitude" field.
  String? _latitude;
  String get latitude => _latitude ?? '';
  set latitude(String? val) => _latitude = val;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  String? _longitude;
  String get longitude => _longitude ?? '';
  set longitude(String? val) => _longitude = val;

  bool hasLongitude() => _longitude != null;

  static RotaDestinoStruct fromMap(Map<String, dynamic> data) =>
      RotaDestinoStruct(
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
      );

  static RotaDestinoStruct? maybeFromMap(dynamic data) => data is Map
      ? RotaDestinoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'latitude': _latitude,
        'longitude': _longitude,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'latitude': serializeParam(
          _latitude,
          ParamType.String,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.String,
        ),
      }.withoutNulls;

  static RotaDestinoStruct fromSerializableMap(Map<String, dynamic> data) =>
      RotaDestinoStruct(
        latitude: deserializeParam(
          data['latitude'],
          ParamType.String,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RotaDestinoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RotaDestinoStruct &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode => const ListEquality().hash([latitude, longitude]);
}

RotaDestinoStruct createRotaDestinoStruct({
  String? latitude,
  String? longitude,
}) =>
    RotaDestinoStruct(
      latitude: latitude,
      longitude: longitude,
    );
