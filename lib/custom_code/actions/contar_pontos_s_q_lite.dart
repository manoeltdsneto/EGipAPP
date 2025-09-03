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

import 'package:sqflite/sqflite.dart';

// DO NOT REMOVE OR MODIFY

Future<int> contarPontosSQLite() async {
  final db = await SQLiteManager.instance.database;

  try {
    final result = await db.rawQuery('SELECT COUNT(*) as total FROM pontos');
    final total = Sqflite.firstIntValue(result) ?? 0;

    FFAppState().logs.add('Total de pontos no SQLite: $total');

    return total;
  } catch (e, stack) {
    FFAppState().logs.add('Erro ao contar pontos no SQLite: $e');
    print('Erro ao contar pontos no SQLite: $e');
    print(stack);
    return 0;
  }
}
