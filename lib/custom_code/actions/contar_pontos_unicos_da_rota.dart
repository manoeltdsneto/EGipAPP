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

Future<int> contarPontosUnicosDaRota(String pontosIdsJson) async {
  final Database db = await SQLiteManager.instance.database;

  try {
    final List<dynamic> idsList = jsonDecode(pontosIdsJson);

    if (idsList.isEmpty) return 0;

    final placeholders = List.filled(idsList.length, '?').join(', ');

    final result = await db.rawQuery(
      '''
      SELECT COUNT(DISTINCT id_ponto) as total
      FROM pontos
      WHERE id IN ($placeholders)
        AND is_deleted = 0
      ''',
      idsList,
    );

    return result.first['total'] as int? ?? 0;
  } catch (e) {
    print('Erro ao contar pontos únicos da rota: $e');
    return 0;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
