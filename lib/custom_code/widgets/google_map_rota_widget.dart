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

import '/custom_code/widgets/index.dart'; // Outros widgets
import '/custom_code/actions/index.dart'; // Ações personalizadas
import '/flutter_flow/custom_functions.dart'; // Funções personalizadas

// IMPORTS NECESSÁRIOS COM PREFIXOS
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:geolocator/geolocator.dart';
import '/flutter_flow/lat_lng.dart' as ff;

class GoogleMapRotaWidget extends StatefulWidget {
  final double height;
  final double width;
  final double destinoLat;
  final double destinoLng;

  const GoogleMapRotaWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.destinoLat,
    required this.destinoLng,
  }) : super(key: key);

  @override
  _GoogleMapRotaWidgetState createState() => _GoogleMapRotaWidgetState();
}

class _GoogleMapRotaWidgetState extends State<GoogleMapRotaWidget> {
  gmaps.GoogleMapController? _mapController;
  ff.LatLng? _posicaoAtual;
  final Set<gmaps.Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _pegarLocalizacaoAtual();
      _desenharRota();
    });
  }

  Future<void> _pegarLocalizacaoAtual() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _posicaoAtual = ff.LatLng(position.latitude, position.longitude);
    });
  }

  void _desenharRota() {
    if (_posicaoAtual == null) return;

    final origem =
        gmaps.LatLng(_posicaoAtual!.latitude, _posicaoAtual!.longitude);
    final destino = gmaps.LatLng(widget.destinoLat, widget.destinoLng);

    final polyline = gmaps.Polyline(
      polylineId: const gmaps.PolylineId('rota'),
      color: Colors.blue,
      width: 5,
      points: [origem, destino],
    );

    setState(() {
      _polylines.add(polyline);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_posicaoAtual == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: gmaps.GoogleMap(
        initialCameraPosition: gmaps.CameraPosition(
          target:
              gmaps.LatLng(_posicaoAtual!.latitude, _posicaoAtual!.longitude),
          zoom: 15,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        polylines: _polylines,
        onMapCreated: (controller) {
          _mapController = controller;
        },
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
