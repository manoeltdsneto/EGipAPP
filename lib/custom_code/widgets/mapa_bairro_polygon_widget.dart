// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports com alias para evitar conflitos
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MapaBairroPolygonWidget extends StatefulWidget {
  final double height;
  final double width;

  const MapaBairroPolygonWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.bairro,
  }) : super(key: key);

  final String bairro;

  @override
  _MapaBairroPolygonWidgetState createState() =>
      _MapaBairroPolygonWidgetState();
}

class _MapaBairroPolygonWidgetState extends State<MapaBairroPolygonWidget> {
  gmaps.GoogleMapController? _mapController;
  List<gmaps.LatLng> _polygonPoints = [];
  Set<gmaps.Polygon> _polygons = {};
  Set<gmaps.Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _carregarPontosDoBairro();
  }

  Future<void> _carregarPontosDoBairro() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bdcoletor.db');
    final db = await openDatabase(path);

    final result = await db.rawQuery(
      '''
      SELECT latitude, longitude, id_ponto 
      FROM pontos 
      WHERE bairro = ? 
        AND latitude IS NOT NULL 
        AND longitude IS NOT NULL
        AND latitude != ''
        AND longitude != ''
        AND is_deleted = 0
      ''',
      [widget.bairro],
    );

    final List<gmaps.LatLng> pontos = [];

    for (final row in result) {
      final lat = double.tryParse(row['latitude'].toString());
      final lng = double.tryParse(row['longitude'].toString());

      if (lat != null && lng != null) {
        final ponto = gmaps.LatLng(lat, lng);
        pontos.add(ponto);

        _markers.add(
          gmaps.Marker(
            markerId: gmaps.MarkerId('${row['id_ponto']}'),
            position: ponto,
            infoWindow: gmaps.InfoWindow(title: 'ID: ${row['id_ponto']}'),
          ),
        );
      }
    }

    if (pontos.isNotEmpty) {
      setState(() {
        _polygonPoints = pontos;
        _polygons = {
          gmaps.Polygon(
            polygonId: const gmaps.PolygonId('bairro_polygon'),
            points: pontos,
            fillColor: Colors.blue.withOpacity(0.2),
            strokeColor: Colors.blue,
            strokeWidth: 3,
          )
        };
      });

      _mapController?.animateCamera(
        gmaps.CameraUpdate.newLatLngZoom(pontos.first, 15),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return gmaps.GoogleMap(
      onMapCreated: (controller) => _mapController = controller,
      initialCameraPosition: const gmaps.CameraPosition(
        target: gmaps.LatLng(-5.185, -38.014),
        zoom: 14,
      ),
      polygons: _polygons,
      markers: _markers,
      mapType: gmaps.MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}
