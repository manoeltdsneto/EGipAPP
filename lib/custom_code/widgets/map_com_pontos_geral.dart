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

class MapComPontosGeral extends StatefulWidget {
  final double height;
  final double width;

  /// 🚀 Trigger externo: quando este valor mudar, o mapa será recarregado.
  final int refreshTrigger;

  const MapComPontosGeral({
    Key? key,
    required this.height,
    required this.width,
    required this.refreshTrigger,
  }) : super(key: key);

  @override
  _MapComPontosGeralState createState() => _MapComPontosGeralState();
}

class _MapComPontosGeralState extends State<MapComPontosGeral> {
  gmaps.GoogleMapController? _mapController;
  final Set<gmaps.Marker> _markers = {};
  gmaps.LatLng? _posicaoInicial;

  @override
  void initState() {
    super.initState();
    // Carrega uma vez ao montar
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _refreshMapa();
    });
  }

  @override
  void didUpdateWidget(covariant MapComPontosGeral oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 🔁 Se o trigger mudou, recarrega o mapa
    if (widget.refreshTrigger != oldWidget.refreshTrigger) {
      _refreshMapa();
    }
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _refreshMapa() async {
    // Reposiciona na localização atual (se possível)
    await _centralizarNaLocalizacao();

    // Se não tiver posição (sem permissão/serviço), apenas limpa e sai
    if (_posicaoInicial == null) {
      setState(() => _markers.clear());
      return;
    }

    // Busca novamente os pontos a partir da posição atual
    final position = await Geolocator.getCurrentPosition();
    final registros = await buscarPontosProximos(
      position.latitude,
      position.longitude,
    );

    // Log simples (opcional)
    FFAppState().logs.add('refreshMapa -> ${registros.length} pontos');

    // Recarrega marcadores
    await _carregarMarcadores(registros);

    // Reposiciona câmera suavemente (opcional)
    if (_mapController != null && mounted) {
      await _mapController!.animateCamera(
        gmaps.CameraUpdate.newCameraPosition(
          gmaps.CameraPosition(target: _posicaoInicial!, zoom: 16),
        ),
      );
    }
  }

  Future<void> _centralizarNaLocalizacao() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Serviço de localização desligado
      setState(() => _posicaoInicial = null);
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // Usuário bloqueou permanentemente: abre configurações
      await Geolocator.openAppSettings();
      setState(() => _posicaoInicial = null);
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    if (!mounted) return;
    setState(() {
      _posicaoInicial = gmaps.LatLng(position.latitude, position.longitude);
    });
  }

  Future<void> _carregarMarcadores(List<dynamic> postes) async {
    // Limpa marcadores antigos antes de repintar
    _markers.clear();

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
      final recenseado = p['recenseado']?.toString().toUpperCase() ?? 'NÃO';
      final endereco = p['endereco']?.toString() ?? '';
      final bairro = p['bairro']?.toString() ?? '';
      final localizacao = p['localizacao']?.toString() ?? '';
      final latitude = double.tryParse(p['latitude']?.toString() ?? '');
      final longitude = double.tryParse(p['longitude']?.toString() ?? '');
      final id_pm_placa = p['id_pm_placa']?.toString() ?? '';

      if (latitude != null && longitude != null) {
        final ff.LatLng local = ff.LatLng(latitude, longitude);

        final marker = gmaps.Marker(
          markerId: gmaps.MarkerId(idd),
          position: gmaps.LatLng(local.latitude, local.longitude),
          icon: recenseado == 'SIM' ? iconVerde : iconPadrao,
          onTap: () {
            _mostrarDetalhes(
              id,
              idd,
              id_ponto,
              local,
              potencia,
              recenseado,
              endereco,
              bairro,
              localizacao,
              id_pm_placa,
            );
          },
        );

        _markers.add(marker);
      }
    }

    if (mounted) setState(() {});
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
    String id_pm_placa,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$endereco - $bairro - $localizacao',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('ID PM PLACA: $id_pm_placa'),
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

                    final imagensSeparadas =
                        separarBase64PorVirgula(dados['imagens'] ?? '');
                    final iddSeparado =
                        separarBase64PorVirgula(dados['idd'] ?? '');

                    final totalIdd = iddSeparado
                        .where((img) => img.trim().isNotEmpty)
                        .length;

                    FFAppState().update(() {
                      FFAppState().index = totalIdd;
                      FFAppState().listaImagensBase64 = imagensSeparadas;
                    });

                    // Fecha o bottom sheet antes de navegar
                    Navigator.pop(context);

                    // 🔙 Aguarda voltar da tela de detalhes e então força o refresh
                    await context.pushNamed('detalheCenso');
                    if (mounted) {
                      _refreshMapa();
                    }
                  },
                  icon: const Icon(Icons.info),
                  label: const Text('Detalhes'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    final url = Uri.parse(
                      'https://www.google.com/maps/dir/?api=1&destination=${local.latitude},${local.longitude}',
                    );
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
    // 👀 Opcional: observar AppState para re-render (caso você prefira)
    // context.watch<FFAppState>();

    if (_posicaoInicial == null) {
      // Enquanto tenta centralizar ou sem permissão
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
