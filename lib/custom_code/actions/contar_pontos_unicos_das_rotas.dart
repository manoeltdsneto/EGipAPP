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
import 'package:sqflite/sqflite.dart';

Future<int> contarPontosUnicosDasRotas() async {
  final db = await SQLiteManager.instance.database;

  // 1. Buscar todas as rotas com pontos_ids_json
  final rotas = await db.query('rotas', columns: ['pontos_ids_json']);

  // 2. Extrair todos os IDs de pontos das rotas
  final Set<int> pontoIds = {};
  for (var r in rotas) {
    final jsonString = r['pontos_ids_json']?.toString() ?? '';
    if (jsonString.isNotEmpty) {
      final List<dynamic> ids = jsonDecode(jsonString);
      pontoIds
          .addAll(ids.map((e) => int.tryParse(e.toString())).whereType<int>());
    }
  }

  if (pontoIds.isEmpty) return 0;

  // 3. Buscar os id_ponto reais correspondentes a esses IDs
  final idList = pontoIds.join(',');
  final result = await db.rawQuery('''
    SELECT DISTINCT id_ponto FROM pontos
    WHERE is_deleted = 0 AND id IN ($idList)
  ''');

  // 4. Retornar a contagem de id_ponto únicos
  return result.length;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
