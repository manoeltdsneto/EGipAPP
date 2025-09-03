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

/// Retorna o total de pontos e quantos já estão recenseados ("SIM")
Future<List<int>> getGlobalProgress() async {
  final db = await SQLiteManager.instance.database;

  // conta todos os pontos
  final totalRes = await db.rawQuery('SELECT COUNT(*) AS cnt FROM pontos');
  final total = Sqflite.firstIntValue(totalRes) ?? 0;

  // conta os concluidos
  final conclRes = await db.rawQuery(
      'SELECT COUNT(*) AS cnt FROM pontos WHERE recenseado = ?', ['SIM']);
  final concl = Sqflite.firstIntValue(conclRes) ?? 0;

  // retorna lista de inteiros: [concluidos, total]
  return [concl, total];
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
