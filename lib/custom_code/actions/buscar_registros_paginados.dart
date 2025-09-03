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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<List<dynamic>> buscarRegistrosPaginados(int offset, int limit) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'bdcoletor.db'); // Nome do seu banco local
  final db = await openDatabase(path);

  final result = await db.rawQuery(
    "SELECT * FROM pontos WHERE is_deleted = 0 AND IFNULL(TRIM(recenseado), '') != 'SIM' LIMIT ? OFFSET ?",
    [limit, offset],
  );

  return List<Map<String, dynamic>>.from(
      result); // Converte cada linha em String JSON
}
