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

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import '/flutter_flow/lat_lng.dart' as ff;
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class MapaComLocalizacaoWidget extends StatefulWidget {
  final double height;
  final double width;

  const MapaComLocalizacaoWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _MapaComLocalizacaoWidgetState createState() =>
      _MapaComLocalizacaoWidgetState();
}

class _MapaComLocalizacaoWidgetState extends State<MapaComLocalizacaoWidget> {
  late gmaps.GoogleMapController _mapController;
  final Set<gmaps.Marker> _markers = {};
  gmaps.LatLng _posicaoInicial = const gmaps.LatLng(-6.347402, -39.3112841);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _carregarMapa();
    });
  }

  Future<void> _carregarMapa() async {
    final registros = await buscarTodosRegistros();
    await _adicionarMinhaLocalizacao();
    if (registros.isNotEmpty) {
      _carregarMarcadores(registros);
    }
    setState(() {});
  }

  Future<void> _adicionarMinhaLocalizacao() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) return;

    final position = await Geolocator.getCurrentPosition();
    final myLatLng = gmaps.LatLng(position.latitude, position.longitude);

    _posicaoInicial = myLatLng;

    _markers.add(gmaps.Marker(
      markerId: const gmaps.MarkerId('minha_localizacao'),
      position: myLatLng,
      infoWindow: const gmaps.InfoWindow(title: 'Você está aqui'),
      icon: gmaps.BitmapDescriptor.defaultMarkerWithHue(
          gmaps.BitmapDescriptor.hueAzure),
    ));

    // Move a câmera para a sua posição
    if (_mapController != null) {
      _mapController.animateCamera(
        gmaps.CameraUpdate.newLatLngZoom(myLatLng, 16),
      );
    }
  }

  void _carregarMarcadores(List<dynamic> postes) async {
    final icon = await gmaps.BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(86, 86)),
      'assets/images/marker-icon.png',
    );

    for (var p in postes) {
      final int id = p['id'] as int;
      final idd = p['idd']?.toString() ?? 'Sem idd';
      final id_ponto = p['id_ponto']?.toString() ?? 'Sem id do ponto';
      final potencia = p['potencia']?.toString() ?? '0';
      final recenseado = p['recenseado']?.toString() ?? '';
      final endereco = p['endereco']?.toString() ?? '';
      final bairro = p['bairro']?.toString() ?? '';
      final localizacao = p['localizacao']?.toString() ?? '';
      final latitude = double.tryParse(p['latitude'].toString());
      final longitude = double.tryParse(p['longitude'].toString());

      if (latitude != null && longitude != null) {
        final ff.LatLng local = ff.LatLng(latitude, longitude);

        final marker = gmaps.Marker(
          markerId: gmaps.MarkerId(idd),
          position: gmaps.LatLng(local.latitude, local.longitude),
          icon: icon,
          onTap: () {
            _mostrarDetalhes(id, idd, id_ponto, local, potencia, recenseado,
                endereco, bairro, localizacao);
          },
        );

        _markers.add(marker);
      }
    }
  }

  void _mostrarDetalhes(
    int id,
    String idd,
    String id_ponto,
    ff.LatLng local,
    String potencia,
    String recenseado,
    String endereco,
    String bairro,
    String localizacao,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$endereco - $bairro - $localizacao',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Potência: $potencia W'),
            Text('IDD: $idd'),
            Text('ID do ponto: $id_ponto'),
            Text('Recenseado: $recenseado'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    final ponto = await buscarPontoPorId(id);

                    if (ponto.isNotEmpty) {
                      FFAppState().ponto =
                          StPontoCadastroStruct.fromMap(ponto.first);
                    }
                    Navigator.pop(context);

                    context.pushNamed(
                      'paginaEdicao',
                      queryParameters: {
                        'id': serializeParam(id, ParamType.int),
                        'idd': serializeParam(idd, ParamType.String),
                      }.withoutNulls,
                    );
                  },
                  icon: const Icon(Icons.info),
                  label: const Text('Detalhes'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    final lat = local.latitude;
                    final lng = local.longitude;
                    final url = Uri.parse(
                        'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng');
                    launchUrl(url);
                  },
                  icon: const Icon(Icons.location_on),
                  label: const Text('Traçar rota'),
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
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: gmaps.GoogleMap(
        initialCameraPosition: gmaps.CameraPosition(
          target: _posicaoInicial,
          zoom: 16,
        ),
        markers: _markers,
        onMapCreated: (controller) {
          _mapController = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
