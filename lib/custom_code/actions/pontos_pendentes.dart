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

/// Set your action name, define your arguments and return parameter, and then
/// add the boilerplate code using the green button on the right!

Future<List<dynamic>> pontosPendentes(int limit) async {
  final db = await SQLiteManager.instance.database;

  // 1. Buscar todos os pontos_ids_json das rotas
  final rotas = await db.query('rotas', columns: ['pontos_ids_json']);

  // 2. Extrair e juntar todos os IDs em uma lista única
  final Set<int> pontoIds = {};

  for (var r in rotas) {
    if (r['pontos_ids_json'] != null &&
        r['pontos_ids_json'].toString().isNotEmpty) {
      final List<dynamic> ids = jsonDecode(r['pontos_ids_json'].toString());
      pontoIds
          .addAll(ids.map((e) => int.tryParse(e.toString())).whereType<int>());
    }
  }

  if (pontoIds.isEmpty) return [];

  // 3. Consulta para pegar o menor id de cada id_ponto entre os pontos das rotas
  final String idList = pontoIds.join(',');

  final query = '''
    SELECT * FROM pontos 
    WHERE is_deleted = 0 
    AND id IN (
      SELECT MIN(id)
      FROM pontos
      WHERE is_deleted = 0
      AND id IN ($idList)
      GROUP BY id_ponto
    )
    AND (recenseado IS NULL OR TRIM(recenseado) = '' OR UPPER(recenseado) != 'SIM')
    ORDER BY id_ponto
    LIMIT ?
  ''';

  final result = await db.rawQuery(query, [limit]);

  return List<Map<String, dynamic>>.from(result);
}

//Future<List<dynamic>> pontosPedentes(int limit) async {
//  final db = await SQLiteManager.instance.database;

//  final query = limit > 0
//      ? 'SELECT * FROM pontos WHERE is_deleted = 0 LIMIT $limit'
//      : 'SELECT * FROM pontos WHERE is_deleted = 0';

//  final result = await db.rawQuery(query);

//  return List<Map<String, dynamic>>.from(
//    result); // Converte cada linha em String JSON
//}

//WHERE recenseado IS NULL OR recenseado = '' OR recenseado <> 'SIM'
