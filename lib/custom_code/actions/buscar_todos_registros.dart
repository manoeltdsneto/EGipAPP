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
import 'package:path/path.dart';

Future<List<dynamic>> buscarTodosRegistros() async {
  try {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bdcoletor.db');
    final db = await openDatabase(path);

    // 1. Buscar todas as rotas
    final rotas = await db.query('rotas');
    final Set<int> todosIds = {};

    // 2. Extrair e converter todos os IDs dos pontos
    for (var rota in rotas) {
      final pontosJson = rota['pontos_ids_json'];
      if (pontosJson != null && pontosJson.toString().trim().isNotEmpty) {
        try {
          final List<dynamic> ids = jsonDecode(pontosJson.toString());
          for (var item in ids) {
            final idInt = int.tryParse(item.toString());
            if (idInt != null) {
              todosIds.add(idInt);
            }
          }
        } catch (e) {
          print('❌ Erro ao decodificar pontos_ids_json: $e');
        }
      }
    }

    print('✅ IDs coletados: $todosIds');

    if (todosIds.isEmpty) return [];

    // 3. Montar placeholders
    final placeholders = List.filled(todosIds.length, '?').join(', ');

    // 4. Buscar os pontos do SQLite
    final result = await db.rawQuery('''
      SELECT * FROM pontos 
      WHERE id IN ($placeholders)
      AND is_deleted = 0
    ''', todosIds.toList());

    print('✅ Pontos retornados: ${result.length}');

    // 5. Agrupar por id_ponto
    final Map<String, Map<String, dynamic>> agrupado = {};
    for (final ponto in result) {
      final idPonto = ponto['id_ponto']?.toString();
      if (idPonto != null && !agrupado.containsKey(idPonto)) {
        agrupado[idPonto] = ponto;
      }
    }

    print('✅ Agrupados (por id_ponto): ${agrupado.length}');

    return agrupado.values.toList();
  } catch (e) {
    print('[x] Erro ao buscar registros do SQLite: $e');
    return [];
  }
}
