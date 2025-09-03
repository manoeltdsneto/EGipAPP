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

//
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<List<dynamic>> buscarTodosPontos() async {
  try {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bdcoletor.db');
    final db = await openDatabase(path);

    // 1. Buscar pontos_ids_json das rotas
    final rotas = await db.query('rotas', columns: ['pontos_ids_json']);

    // 2. Extrair todos os IDs das rotas
    final Set<int> pontoIds = {};
    for (var r in rotas) {
      final jsonString = r['pontos_ids_json']?.toString() ?? '';
      if (jsonString.isNotEmpty) {
        final List<dynamic> ids = jsonDecode(jsonString);
        pontoIds.addAll(
            ids.map((e) => int.tryParse(e.toString())).whereType<int>());
      }
    }

    if (pontoIds.isEmpty) {
      FFAppState().logs.add('Nenhum ponto encontrado nas rotas.');
      return [];
    }

    // 3. Consulta com filtro e agrupamento por id_ponto
    final String idList = pontoIds.join(',');
    final query = '''
      SELECT * FROM pontos
      WHERE id IN ($idList)
        AND is_deleted = 0
        AND IFNULL(TRIM(recenseado), '') != 'SIM'
      GROUP BY id_ponto
      ORDER BY id_ponto ASC
    ''';

    final result = await db.rawQuery(query);

    FFAppState().logs.add('Total de pontos agrupados: ${result.length}');
    return List<Map<String, dynamic>>.from(result);
  } catch (e) {
    print('[x] Erro ao buscar registros do SQLite: $e');
    FFAppState().logs.add('Erro ao buscarTodosPontos: $e');
    return [];
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
