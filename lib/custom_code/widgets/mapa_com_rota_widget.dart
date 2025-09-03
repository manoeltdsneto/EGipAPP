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

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:geolocator/geolocator.dart';

class MapaComRotaWidget extends StatefulWidget {
  final double height;
  final double width;
  final String destinoLat;
  final String destinoLng;
  final int idPonto;

  const MapaComRotaWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.destinoLat,
    required this.destinoLng,
    required this.idPonto,
  }) : super(key: key);

  @override
  _MapaComRotaWidgetState createState() => _MapaComRotaWidgetState();
}

class _MapaComRotaWidgetState extends State<MapaComRotaWidget> {
  late gmaps.GoogleMapController _mapController;
  final Set<gmaps.Marker> _markers = {};
  final Set<gmaps.Polyline> _polylines = {};
  gmaps.LatLng? _localAtual;
  gmaps.LatLng? _destino;
  bool _carregando = true;

  @override
  void initState() {
    super.initState();
    _start();
  }

  Future<void> _start() async {
    await _inicializarMapa();
  }

  Future<void> _inicializarMapa() async {
    await _definirLocalAtual();

    _definirDestino();

    if (_destino != null) {
      _adicionarMarcadorDestino(widget.idPonto, _destino!);
      _tracarRota();
    }

    setState(() => _carregando = false);
  }

  Future<void> _definirLocalAtual() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return;
      }

      if (permission == LocationPermission.deniedForever) {
        await Geolocator.openAppSettings();
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _localAtual = gmaps.LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      debugPrint('Erro ao obter localização: $e');
    }
  }

  void _definirDestino() {
    final lat = double.tryParse(widget.destinoLat);
    final lng = double.tryParse(widget.destinoLng);

    if (lat != null && lng != null) {
      _destino = gmaps.LatLng(lat, lng);
    }
  }

  void _adicionarMarcadorDestino(int id, gmaps.LatLng destino) {
    _markers.add(
      gmaps.Marker(
        markerId: gmaps.MarkerId(id.toString()),
        position: destino,
        infoWindow: const gmaps.InfoWindow(title: 'Destino'),
        onTap: () async {
          FFAppState().pontoView = {}; // limpa estado anterior

          final resultado = await buscarPontoPorId(id);
          if (resultado.isNotEmpty) {
            setState(() {
              FFAppState().pontoView = resultado.first;
            });
            _mostrarDetalhesDoPonto();
          }
        },
      ),
    );
  }

  void _tracarRota() {
    if (_localAtual != null && _destino != null) {
      _polylines.add(
        gmaps.Polyline(
          polylineId: const gmaps.PolylineId('rota'),
          points: [_localAtual!, _destino!],
          color: Colors.green,
          width: 4,
        ),
      );
    }
  }

  void _mostrarDetalhesDoPonto() {
    final dados = FFAppState().pontoView;
    final idPonto = dados['id_ponto'] ?? '';
    final endereco = dados['endereco'] ?? '';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ponto: $idPonto',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Endereço: $endereco'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.edit),
                  label: const Text('Editar ponto'),
                  onPressed: () {
                    Navigator.pop(context);
                    context.pushNamed('edit');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_carregando) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_localAtual == null) {
      return const Center(
        child: Text(
          "Localização atual não disponível.",
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: gmaps.GoogleMap(
        initialCameraPosition: gmaps.CameraPosition(
          target: _localAtual!,
          zoom: 15,
        ),
        onMapCreated: (controller) => _mapController = controller,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: _markers,
        polylines: _polylines,
      ),
    );
  }
}
