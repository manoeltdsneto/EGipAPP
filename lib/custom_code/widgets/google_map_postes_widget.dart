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
import '/flutter_flow/lat_lng.dart' as ff;
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapPostesWidget extends StatefulWidget {
  final double height;
  final double width;

  const GoogleMapPostesWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _GoogleMapPostesWidgetState createState() => _GoogleMapPostesWidgetState();
}

class _GoogleMapPostesWidgetState extends State<GoogleMapPostesWidget> {
  late gmaps.GoogleMapController _mapController;
  final Set<gmaps.Marker> _markers = {};
  //final Set<gmaps.Polygon> _polygons = {};
  gmaps.LatLng? _posicaoInicial;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _centralizarNaLocalizacao();
      final registros = await buscarTodosRegistros();
      _carregarMarcadores(registros);
      //_carregarAreaDeTrabalho();
    });
  }

  Future<void> _centralizarNaLocalizacao() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _posicaoInicial = gmaps.LatLng(position.latitude, position.longitude);
    });
  }

  void _carregarMarcadores(List<dynamic> postes) async {
    //final icon = await gmaps.BitmapDescriptor.fromAssetImage(
    //const ImageConfiguration(size: Size(86, 86)),
    //'assets/images/marker-icon.png',
    //);
    final iconPadrao = await gmaps.BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(86, 86)),
      'assets/images/marker-icon.png',
    );

    final iconVerde = await gmaps.BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(86, 86)),
      'assets/images/marker-icon-verde.png',
    );

    for (var p in postes) {
      final int id = p['id'] as int;
      final idd = p['idd']?.toString() ?? 'Sem idd';
      final id_ponto = p['id_ponto']?.toString() ?? 'Sem id do ponto';
      final potencia = p['potencia']?.toString() ?? '0';
      final recenseado = p['recenseado']?.toString() ?? 'NÃO';
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
          icon: recenseado == 'SIM' ? iconVerde : iconPadrao,
          onTap: () {
            _mostrarDetalhes(id, idd, id_ponto, local, potencia, recenseado,
                endereco, bairro, localizacao);
          },
        );

        _markers.add(marker);
      }
    }

    setState(() {});
  }

  //void _carregarAreaDeTrabalho() {
  //  final List<gmaps.LatLng> area = [
  //    gmaps.LatLng(-6.409369, -38.844824),
  //    gmaps.LatLng(-6.409115, -38.845005),
  //    gmaps.LatLng(-6.406890, -38.846480),
  //    gmaps.LatLng(-6.406239, -38.845359),
  //    gmaps.LatLng(-6.408455, -38.843477),
  //    gmaps.LatLng(-6.407786, -38.845430),
  //    gmaps.LatLng(-6.407659, -38.844870),
  //    gmaps.LatLng(-6.407776, -38.844427),
  //  ];

  //  _polygons.add(
  //    gmaps.Polygon(
  //      polygonId: const gmaps.PolygonId('area_trabalho'),
  //      points: area,
  //      strokeColor: Colors.blue,
  //      strokeWidth: 2,
  //     fillColor: Colors.blue.withOpacity(0.2),
  //    ),
  //  );
  // }

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
                    await buscarPontoPorIdUnico(id);
                    final dados = FFAppState().pontoView;
                    // Separar imagens
                    final imagensSeparadas =
                        separarBase64PorVirgula(dados['imagens'] ?? '');

                    final iddSeparado =
                        separarBase64PorVirgula(dados['idd'] ?? '');

                    // Contar imagens válidas
                    final totalIdd = iddSeparado
                        .where((img) => img.trim().isNotEmpty)
                        .length;

                    FFAppState().update(() {
                      FFAppState().index = totalIdd;
                    });

                    // Armazenar em outros estados, se necessário
                    FFAppState().update(() {
                      FFAppState().listaImagensBase64 = imagensSeparadas;
                    });

                    Navigator.pop(context);

                    context.pushNamed('detalheCenso');
                  },
                  icon: const Icon(Icons.info),
                  label: const Text('Detalhes'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    final url = Uri.parse(
                        'https://www.google.com/maps/dir/?api=1&destination=${local.latitude},${local.longitude}');
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
    if (_posicaoInicial == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: gmaps.GoogleMap(
        initialCameraPosition: gmaps.CameraPosition(
          target: _posicaoInicial!,
          zoom: 16,
        ),
        //mapType: gmaps.MapType.hybrid,
        markers: _markers,
        //polygons: _polygons,
        onMapCreated: (controller) {
          _mapController = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
