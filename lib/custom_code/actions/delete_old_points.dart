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

// Import necessário
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<void> deleteOldPoints() async {
  try {
    // Reaproveita a instância do SQLiteManager
    final Database db = await SQLiteManager.instance.database;

    // Data limite (15 dias atrás)
    final limite =
        DateTime.now().subtract(Duration(days: 15)).toIso8601String();

    // Executa delete
    final count = await db.delete(
      'pontos',
      where: "updated_at < ?",
      whereArgs: [limite],
    );

    print("🗑️ Registros deletados: $count");
  } catch (e) {
    print("Erro ao deletar registros antigos: $e");
  }
}
