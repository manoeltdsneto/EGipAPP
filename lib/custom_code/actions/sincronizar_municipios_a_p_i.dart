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
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<bool> sincronizarMunicipiosAPI() async {
  try {
    final url = Uri.parse('https://egip.com.br/api/municipioList.php');

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer app_2bcd0ea6e9e01d52a390a142f92d6e4dc8c1a6b370cd7f47babe75eae978aadb',
    });

    if (response.statusCode != 200) {
      print('Erro ao acessar API: ${response.body}');
      return false;
    }

    final data = jsonDecode(response.body);

    if (data is! List) {
      print('Formato de resposta inválido');
      return false;
    }

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bdcoletor.db');
    final db = await openDatabase(path);

    // Cria a tabela se ainda não existir
    await db.execute('''
      CREATE TABLE IF NOT EXISTS municipios_recenseamento (
        id INTEGER PRIMARY KEY,
        municipio TEXT,
        cod_ibge INTEGER,
        status TEXT
      );
    ''');

    // Deleta tudo antes de inserir
    await db.delete('municipios_recenseamento');

    for (final municipio in data) {
      await db.insert(
        'municipios_recenseamento',
        {
          'id': municipio['id'],
          'municipio': municipio['municipio'],
          'cod_ibge': int.tryParse(municipio['cod_ibge'].toString()) ?? 0,
          'status': municipio['status'] ?? '',
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    print('Municípios sincronizados com sucesso');
    return true;
  } catch (e) {
    print('Erro ao sincronizar municípios: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
