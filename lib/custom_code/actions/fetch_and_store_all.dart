// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

Future<bool> fetchAndStoreAll(int recenseador) async {
  try {
    final db = await SQLiteManager.instance.database;
    final urlBase = FFAppState().settings.url ?? '';
    final token = FFAppState().settings.token ?? '';
    final municipio = FFAppState().settings.codMunicipio ?? '';

    final url = Uri.parse(
      '${urlBase}get_rotas_com_pontos.php?recenseador=$recenseador&cod_municipio=$municipio',
    );

    final resp = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (resp.statusCode != 200) {
      FFAppState().logs.add('Erro na API: ${resp.statusCode}');
      return false;
      //throw Exception('Erro na API: ${resp.statusCode}');
    }

    final payload = jsonDecode(resp.body) as Map<String, dynamic>;
    if (payload['status'] != 'success') {
      FFAppState().logs.add('API retornou status != success');
      return false;
      //throw Exception('API retornou status != success');
    }

    final rotasList = payload['rotas'] as List<dynamic>;
    final todosPontos = payload['pontos'] as List<dynamic>;

    FFAppState()
        .logs
        .add('Quantidade de pontos no JSON: ${todosPontos.length}');

    await db.transaction((txn) async {
      // 1. Inserir todas as rotas
      for (var r in rotasList) {
        final rota = r as Map<String, dynamic>;
        final origem = rota['origem'] as Map<String, dynamic>? ?? {};
        final destino = rota['destino'] as Map<String, dynamic>? ?? {};
        final waypts = rota['waypoints'] as List<dynamic>? ?? [];

        final rotaRow = {
          'id': int.tryParse(rota['id'].toString()) ?? 0,
          'nome': rota['nome'] as String? ?? '',
          'recenseador': int.tryParse(rota['recenseador'].toString()) ?? 0,
          'total': int.tryParse(rota['total'].toString()) ?? 0,
          'origem_lat': origem['lat']?.toString() ?? '',
          'origem_lng': origem['lng']?.toString() ?? '',
          'destino_lat': destino['lat']?.toString() ?? '',
          'destino_lng': destino['lng']?.toString() ?? '',
          'waypoints_json': jsonEncode(waypts),
          'pontos_ids_json': jsonEncode(rota['pontos_ids_json'] ?? []),
          'data_criacao': rota['data_criacao']?.toString() ?? '',
        };

        await txn.insert(
          'rotas',
          rotaRow,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      // 2. Inserir todos os pontos
      for (var p in todosPontos) {
        final pt = p as Map<String, dynamic>;
        final pontoId = int.tryParse(pt['id'].toString()) ?? 0;

        if (pontoId == 0) {
          FFAppState()
              .logs
              .add('⚠️ ID inválido no ponto: ${pt['id']} - ${pt['idd']}');
        }

        final pontoRow = {
          'id': pontoId,
          'idd': pt['idd'] as String? ?? '',
          'id_ponto': pt['id_ponto'] as String? ?? null,
          'municipio': pt['municipio'] as String? ?? null,
          'cod_municipio': int.tryParse(pt['cod_municipio'].toString()) ?? 0,
          'sequencia': pt['sequencia'] as String? ?? null,
          'transformador': pt['transformador'] as String? ?? null,
          'chave': pt['chave'] as String? ?? null,
          'posicao': pt['posicao'] as String? ?? null,
          'endereco': pt['endereco'] as String? ?? null,
          'bairro': pt['bairro'] as String? ?? null,
          'acervo_poste': pt['acervo_poste'] as String? ?? null,
          'medicao': pt['medicao'] as String? ?? null,
          'medidor_nc': pt['medidor_nc'] as String? ?? null,
          'localizacao': pt['localizacao'] as String? ?? null,
          'tipo_lampada': pt['tipo_lampada'] as String? ?? '',
          'potencia': pt['potencia'] as String? ?? '',
          'tipo_luminaria': pt['tipo_luminaria'] as String? ?? '',
          'fabricante_luminaria': pt['fabricante_luminaria'] as String? ?? '',
          'tipo_rede': pt['tipo_rede'] as String? ?? null,
          'fase_ligacao': pt['fase_ligacao'] as String? ?? null,
          'id_pm_placa': pt['id_pm_placa'] as String? ?? null,
          'medidor_referencia': pt['medidor_referencia'] as String? ?? null,
          'utm_x': pt['utm_x'] as String? ?? null,
          'utm_y': pt['utm_y'] as String? ?? null,
          'latitude': pt['latitude'] as String? ?? null,
          'longitude': pt['longitude'] as String? ?? null,
          'zona': pt['zona'] as String? ?? null,
          'observacao': pt['observacao'] as String? ?? null,
          'circuito_exclusivo': pt['circuito_exclusivo'] as String? ?? null,
          'rele_fotoeletrico': pt['rele_fotoeletrico'] as String? ?? null,
          'medido': pt['medido'] as String? ?? null,
          'recenseado': pt['recenseado'] as String? ?? null,
          'data_recenseamento': pt['data_recenseamento'] as String?,
          'tipo_poste': pt['tipo_poste'] as String? ?? null,
          'altura_poste': pt['altura_poste'] as String? ?? null,
          'tamanho_braco': pt['tamanho_braco'] as String? ?? null,
          'ponto_novo': pt['ponto_novo'] as String? ?? null,
          'laudo_tecnico': pt['laudo_tecnico'] as String? ?? null,
          'historico': pt['historico'] as String? ?? null,
          'timeline': pt['timeline'] as String? ?? null,
          'manutencoes': pt['manutencoes'] as String? ?? null,
          'imagens': pt['imagens'] as String? ?? null,
          'alteracoes': pt['alteracoes'] as String? ?? null,
          'anexos': pt['anexos'] as String? ?? null,
          'responsavel': int.tryParse(pt['responsavel']?.toString() ?? '') ?? 0,
          'cadastrado_por':
              int.tryParse(pt['cadastrado_por']?.toString() ?? '') ?? null,
          'data_cadastro': pt['data_cadastro'] as String?,
          'updated_at': pt['updated_at'] as String? ?? '',
          'is_deleted': int.tryParse(pt['is_deleted'].toString()) ?? 0,
          'deleted_at': pt['deleted_at'] as String?,
          'municipio_id': pt['municipio_id'] as int? ?? 0,
          'alterado': pt['alterado'] as String? ?? null,
        };

        await txn.insert(
          'pontos',
          pontoRow,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });

    return true;
  } catch (e, stack) {
    FFAppState().logs.add('❌ Erro geral em fetchAndStoreAll: $e');
    print('Erro geral em fetchAndStoreAll: $e');
    print(stack);
    return false;
  }
}
