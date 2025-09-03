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
import 'package:path/path.dart';

Future<List<dynamic>> listarBairrosUnicos() async {
  // Caminho para o banco de dados local
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'bdcoletor.db');

  // Abre o banco de dados
  final db = await openDatabase(path);

  // Executa a query
  final result = await db.rawQuery(
    'SELECT DISTINCT bairro FROM pontos WHERE bairro IS NOT NULL AND bairro != "" ORDER BY bairro ASC',
  );

  // Retorna a lista de bairros únicos como List<String>
  return List<Map<String, dynamic>>.from(result);
}
