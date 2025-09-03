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

Future<void> buscarPontoPorIdUnico(int id) async {
  final Database db = await SQLiteManager.instance.database;

  final result = await db.rawQuery(
    'SELECT * FROM pontos WHERE id = ? LIMIT 1',
    [id],
  );

  if (result.isNotEmpty) {
    final ponto = result.first; // Map<String, dynamic>

    // Salva no AppState como JSON (dicionário)
    FFAppState().update(() {
      FFAppState().pontoView = json.decode(json.encode(ponto));
    });
  } else {
    // Nenhum resultado encontrado, limpa o AppState
    FFAppState().update(() {
      FFAppState().pontoView = {};
    });
    debugPrint('Nenhum ponto encontrado com id $id');
  }
}
