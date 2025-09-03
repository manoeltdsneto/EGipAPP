// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RotaLatLogStruct extends BaseStruct {
  RotaLatLogStruct({
    int? id,
    double? latitude,
    double? longitude,
  })  : _id = id,
        _latitude = latitude,
        _longitude = longitude;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

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

  static RotaLatLogStruct fromMap(Map<String, dynamic> data) =>
      RotaLatLogStruct(
        id: castToType<int>(data['id']),
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
      );

  static RotaLatLogStruct? maybeFromMap(dynamic data) => data is Map
      ? RotaLatLogStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'latitude': _latitude,
        'longitude': _longitude,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
      }.withoutNulls;

  static RotaLatLogStruct fromSerializableMap(Map<String, dynamic> data) =>
      RotaLatLogStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
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
      );

  @override
  String toString() => 'RotaLatLogStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RotaLatLogStruct &&
        id == other.id &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode => const ListEquality().hash([id, latitude, longitude]);
}

RotaLatLogStruct createRotaLatLogStruct({
  int? id,
  double? latitude,
  double? longitude,
}) =>
    RotaLatLogStruct(
      id: id,
      latitude: latitude,
      longitude: longitude,
    );
