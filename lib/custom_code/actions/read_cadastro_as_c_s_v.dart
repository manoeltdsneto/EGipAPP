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

Future<String> readCadastroAsCSV() async {
  final db = await SQLiteManager.instance.database;

  // Adiciona filtro WHERE sincronizado = 0
  final result = await db.query(
    'pontos',
    where: 'sincronizado = ?',
    whereArgs: [0],
  );

  await db.close();

  if (result.isEmpty) return '';

  final headers = result.first.keys.toList();
  final rows = result.map((row) {
    return headers.map((key) => '${row[key]}').join(',');
  }).toList();

  final csv = StringBuffer();
  csv.writeln(headers.join(','));
  for (var row in rows) {
    csv.writeln(row);
  }

  return csv.toString();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
