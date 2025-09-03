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

//
// import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<List<dynamic>> buscarRegistrosPaginadosComFiltro(
  int offset,
  int limit,
  String? idd,
  String? endereco,
  String? municipio,
  String? bairro,
  String? idPonto,
  String? localizacao,
) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'bdcoletor.db');
  final db = await openDatabase(path);

  String whereClause = '';
  List<String> whereConditions = [];
  List<dynamic> whereArgs = [];

  if (idd != null && idd.isNotEmpty) {
    whereConditions.add('idd LIKE ?');
    whereArgs.add('%$idd%');
  }
  if (endereco != null && endereco.isNotEmpty) {
    whereConditions.add('endereco LIKE ?');
    whereArgs.add('%$endereco%');
  }
  if (municipio != null && municipio.isNotEmpty) {
    whereConditions.add('municipio LIKE ?');
    whereArgs.add('%$municipio%');
  }
  if (bairro != null && bairro.isNotEmpty) {
    whereConditions.add('bairro LIKE ?');
    whereArgs.add('%$bairro%');
  }
  if (idPonto != null && idPonto.isNotEmpty) {
    whereConditions.add('id_ponto LIKE ?');
    whereArgs.add('%$idPonto%');
  }
  if (localizacao != null && localizacao.isNotEmpty) {
    whereConditions.add('localizacao LIKE ?');
    whereArgs.add('%$localizacao%');
  }

  if (whereConditions.isNotEmpty) {
    whereClause = 'WHERE ' + whereConditions.join(' AND ');
  }

  final query = '''
    SELECT * FROM pontos
    $whereClause
    LIMIT ? OFFSET ?
  ''';

  whereArgs.addAll([limit, offset]);

  final result = await db.rawQuery(query, whereArgs);

  return List<Map<String, dynamic>>.from(result);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
