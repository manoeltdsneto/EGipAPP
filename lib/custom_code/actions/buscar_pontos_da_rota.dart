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

import 'dart:convert';
import 'package:sqflite/sqflite.dart';

Future<List<dynamic>> buscarPontosDaRota(String pontosIdsJson) async {
  final Database db = await SQLiteManager.instance.database;

  try {
    final List<dynamic> idsList = jsonDecode(pontosIdsJson);

    if (idsList.isEmpty) {
      return [];
    }

    final placeholders = List.filled(idsList.length, '?').join(', ');

    final List<Map<String, dynamic>> pontos = await db.rawQuery(
      '''
      SELECT * FROM pontos 
      WHERE id IN ($placeholders) AND is_deleted = 0
      GROUP BY id_ponto
      ORDER BY id DESC
      ''',
      idsList,
    );

    return pontos;
  } catch (e) {
    print('Erro ao buscar pontos da rota (agrupados): $e');
    return [];
  }
}
