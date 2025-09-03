import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/custom_auth/auth_util.dart';

double? getLng(LatLng? latlng) {
  return latlng?.longitude;
}

double? getLat(LatLng? getlat) {
  return getlat?.latitude;
}

List<String> formatarPotenciasLista(List<int> potencias) {
  return potencias.map((p) => '${p}').toList();
}

String convertPassword(String senha) {
  return senha.toString();
}

String joinBase64Images(List<String> imagens) {
  return imagens.join(',');
}

FFUploadedFile base64img(String imagembase64) {
  final bytesdec = base64Decode(imagembase64);
  return FFUploadedFile(bytes: bytesdec);
}

double converterLatitudeUTM(double northing) {
// Zona 24S do UTM para o Ceará, aproximação básica
  // Ajuste fino pode ser feito com backend se necessário
  // Esse valor é uma estimativa empírica com deslocamento
  const baseLat = -0.00001;
  return baseLat + (northing * 0.0000009); // fator ajustado
}

double converterLongitudeUTM(double easting) {
  // Zona 24S do UTM para o Ceará
  const baseLon = -50.0;
  return baseLon + (easting * 0.0000011); // fator ajustado
}

List<String> separarBase64PorVirgula(String imagensStr) {
  if (imagensStr.isEmpty) return [];
  return imagensStr
      .split(',')
      .where((e) => e.trim().isNotEmpty)
      .map((e) => e.trim())
      .toList();
}

bool chegouNaUltimaPagina(
  int paginaAtual,
  int tamanhoPagina,
  int total,
) {
  return (paginaAtual + 1) * tamanhoPagina >= total;
}

String listaParaStringVirgula(List<String> itens) {
  if (itens.isEmpty) return '';
  return itens.join(',');
}

List<String> separarPorVirgula(String texto) {
  if (texto.trim().isEmpty) return [];

  return texto
      .split(',')
      .map((item) => item.trim())
      .where((item) => item.isNotEmpty)
      .toList();
}

String getDataHoraAtual() {
  //final agora = DateTime.now();
  final agora = DateTime.now();
  final formatador = DateFormat('yyyy-MM-dd HH:mm:ss');
  final dataFormatada = formatador.format(agora);

  return dataFormatada;
}

double stringToDouble(String valor) {
  return double.tryParse(valor) ?? 0.0;
}

String joinCampos(List<String> items) {
  return items
      .where((s) => s != null && s.trim().isNotEmpty)
      .map((s) => s!.trim())
      .join(', ');
}

List<String> buildIluminacoesStrings(
  String? idd1,
  String? idd2,
  String? idd3,
  String? idd4,
  String? lamp1,
  String? lamp2,
  String? lamp3,
  String? lamp4,
  String? lum1,
  String? lum2,
  String? lum3,
  String? lum4,
  String? fab1,
  String? fab2,
  String? fab3,
  String? fab4,
  String? pot1,
  String? pot2,
  String? pot3,
  String? pot4,
  int count,
) {
  final ids = [idd1, idd2, idd3, idd4];
  final lamps = [lamp1, lamp2, lamp3, lamp4];
  final lumis = [lum1, lum2, lum3, lum4];
  final pots = [pot1, pot2, pot3, pot4];
  final fabs = [fab1, fab2, fab3, fab4];

  String joinCampos(List<String?> items) {
    return items
        .where((s) => s != null && s.trim().isNotEmpty)
        .map((s) => s!.trim())
        .join(', ');
  }

  return [
    joinCampos(ids.sublist(0, count)),
    joinCampos(lamps.sublist(0, count)),
    joinCampos(lumis.sublist(0, count)),
    joinCampos(pots.sublist(0, count)),
    joinCampos(fabs.sublist(0, count)),
  ];
}

String joinIdd(
  String? idd1,
  String? idd2,
  String? idd3,
  String? idd4,
) {
  final idds = [idd1, idd2, idd3, idd4]
      .where((s) => s != null && s.trim().isNotEmpty)
      .map((s) => s!.trim())
      .toList();

  return idds.join(',');
}

String joinLampada(
  String? lamp1,
  String? lamp2,
  String? lamp3,
  String? lamp4,
) {
  final lamapada = [lamp1, lamp2, lamp3, lamp4]
      .where((s) => s != null && s.trim().isNotEmpty)
      .map((s) => s!.trim())
      .toList();

  return lamapada.join(',');
}

String joinLuminaria(
  String? lumi1,
  String? lumi2,
  String? lumi3,
  String? lumi4,
) {
  final luminaria = [lumi1, lumi2, lumi3, lumi4]
      .where((s) => s != null && s.trim().isNotEmpty)
      .map((s) => s!.trim())
      .toList();

  return luminaria.join(',');
}

String joinPotencia(
  String? pot1,
  String? pot2,
  String? pot3,
  String? pot4,
) {
  final potencia = [pot1, pot2, pot3, pot4]
      .where((s) => s != null && s.trim().isNotEmpty)
      .map((s) => s!.trim())
      .toList();

  return potencia.join(',');
}

String joinFabricante(
  String? fab1,
  String? fab2,
  String? fab3,
  String? fab4,
) {
  final fabricante = [fab1, fab2, fab3, fab4]
      .where((s) => s != null && s.trim().isNotEmpty)
      .map((s) => s!.trim())
      .toList();

  return fabricante.join(',');
}

String converterParaDateTime(String dataTexto) {
  try {
    final data = DateTime.parse(dataTexto);
    final formato = DateFormat('dd/MM/yyyy HH:mm');
    return formato.format(data);
  } catch (e) {
    print('Erro ao formatar: $e');
    return ''; // ✅ agora retorna uma String válida sempre
  }
}

String extrairIdsParaSqlIn(String pontosIdsJson) {
  try {
    final cleaned = pontosIdsJson
        .replaceAll('[', '')
        .replaceAll(']', '')
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .join(',');

    return cleaned;
  } catch (e) {
    print('Erro ao processar pontos_ids_json: $e');
    return '';
  }
  // Retorna lista vazia em caso de erro
}

String intParaString(int valorInt) {
  return valorInt.toString();
}

List<dynamic> marcarDeletaveis(List<dynamic> registros) {
  for (int i = 0; i < registros.length; i++) {
    final map = registros[i] as Map<String, dynamic>;
    map['podeExcluir'] = i != 0;
  }
  return registros;
}

List<String> jsonManutencoesParaLista(String jsonString) {
  try {
    final List<dynamic> lista = jsonDecode(jsonString);

    final List<String> resultado = lista.map((item) {
      final tipo = item['tipo_servico'] ?? '';
      return tipo.toString();
    }).toList();

    return resultado;
  } catch (e) {
    print('Erro ao converter JSON: $e');
    return [];
  }
}
