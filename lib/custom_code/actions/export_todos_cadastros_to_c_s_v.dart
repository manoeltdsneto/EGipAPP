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

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

Future<String> exportTodosCadastrosToCSV(int id) async {
  final dbPath = await getDatabasesPath();
  final db = await openDatabase('$dbPath/bdcoletor.db'); // ajuste o nome

  final result = await db.rawQuery('SELECT * FROM cadastro WHERE Id = ?', [id]);

  if (result.isEmpty) return 'NENHUM REGISTRO ENCONTRADO';

  final headers = result.first.keys.join(',');
  final row = result.first.values.join(',');
  final csv = '$headers\n$row';

  final dir = await getApplicationDocumentsDirectory();
  final path = '${dir.path}/cadastro_id_$id.csv';
  final file = File(path);
  await file.writeAsString(csv);

  return path;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
