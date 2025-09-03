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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<int> contarPostesRecenseados() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'bdcoletor.db');
  final db = await openDatabase(path);

  final result = await db.rawQuery(
      "SELECT COUNT(*) AS total FROM pontos WHERE recenseado = 'SIM'");

  return Sqflite.firstIntValue(result) ?? 0;
}
