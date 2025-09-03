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

Future<String> getCadastrosJson() async {
  // Caminho do banco de dados local
  final databasePath = await getDatabasesPath();
  final path = join(
      databasePath, 'bdcoletor.db'); // substitua pelo nome real do seu banco

  // Abre o banco
  final db = await openDatabase(path);

  // Consulta todos os registros
  final List<Map<String, dynamic>> results = await db.query('pontos');

  // Converte para JSON
  final jsonString = jsonEncode(results);

  return jsonString;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
