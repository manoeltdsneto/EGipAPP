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
import 'package:path/path.dart';

Future<bool> sincronizarPonto(int userID) async {
  try {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bdcoletor.db');
    final db = await openDatabase(path);

    final urlBase = FFAppState().settings.url ?? '';
    final token = FFAppState().settings.token ?? '';

    // Busca pontos que ainda não foram sincronizados
    final List<Map<String, dynamic>> registros = await db.query(
      'pontos',
      where: 'sincronizado = 0 OR sincronizado = 2',
    );

    if (registros.isEmpty) {
      print('[✓] Nenhum ponto pendente para sincronizar.');
      return true;
    }

    // Monta dados para envio
    final List<Map<String, dynamic>> dadosCompletos = [];
    for (var ponto in registros) {
      dadosCompletos.add(Map<String, dynamic>.from(ponto));
    }

    final uri = Uri.parse('${urlBase}sincronizar_pontos.php');

    http.Response response;
    try {
      response = await http
          .post(
            uri,
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
            body: json
                .encode({'cadastrado_por': userID, 'dados': dadosCompletos}),
          )
          .timeout(const Duration(seconds: 20)); // timeout para evitar travas
    } on Exception catch (e) {
      // Erro de rede (sem internet, timeout, etc.)
      print('[x] Erro de conexão: $e');
      FFAppState().logs.add('[x] Erro de conexão: $e');

      // marca como erro temporário para tentar novamente depois
      for (var reg in registros) {
        if (reg['id'] != null) {
          await db.update(
            'pontos',
            {'sincronizado': 2},
            where: 'id = ?',
            whereArgs: [reg['id']],
          );
        }
      }
      return false;
    }

    // Tratamento de resposta
    if (response.statusCode == 200) {
      final result = json.decode(response.body);

      if (result['success'] == true) {
        final enviados =
            result['ids'] ?? []; // sua API pode devolver os ids confirmados

        if (enviados.isNotEmpty) {
          for (var id in enviados) {
            await db.update(
              'pontos',
              {'sincronizado': 1},
              where: 'id = ?',
              whereArgs: [id],
            );
          }
        } else {
          // Se API não devolver IDs, marca todos como sincronizados
          for (var reg in registros) {
            if (reg['id'] != null) {
              await db.update(
                'pontos',
                {'sincronizado': 1},
                where: 'id = ?',
                whereArgs: [reg['id']],
              );
            }
          }
        }

        print('[✓] Sincronização concluída com sucesso.');
        return true;
      } else {
        print('[x] Erro da API: ${result['message']}');
        FFAppState().logs.add('Erro da API: ${result['message']}');

        // Não marca como sincronizado, apenas deixa para tentar novamente
        return false;
      }
    } else if (response.statusCode == 401) {
      print('[x] Token inválido/expirado.');
      FFAppState().logs.add('[x] Token inválido/expirado.');
      return false;
    } else {
      print('[x] Erro HTTP: ${response.statusCode} - ${response.body}');
      FFAppState()
          .logs
          .add('Erro HTTP: ${response.statusCode} - ${response.body}');
      return false;
    }
  } catch (e, st) {
    print('[x] Erro inesperado: $e');
    print(st);
    FFAppState().logs.add('[x] Erro inesperado: $e');
    return false;
  }
}
