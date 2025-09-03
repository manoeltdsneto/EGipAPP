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

/// Set your action name, define your arguments and return parameter, and then
/// add the boilerplate code using the green button on the right!
Future<List<dynamic>> buscarPontoPorId(int id) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'bdcoletor.db');
  final db = await openDatabase(path);

  final result = await db.rawQuery(
    'SELECT * FROM pontos WHERE id = ? LIMIT 1',
    [id],
  );

  return List<Map<String, dynamic>>.from(result);
}
