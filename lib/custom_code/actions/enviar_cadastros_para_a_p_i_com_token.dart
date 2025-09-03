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

Future<bool> enviarCadastrosParaAPIComToken() async {
  try {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bdcoletor.db'); // substitua pelo seu nome real
    final db = await openDatabase(path);

    final List<Map<String, dynamic>> cadastros = await db.query('pontos');

    if (cadastros.isEmpty) return false;

    final response = await http.post(
      Uri.parse('https://egip.com.br/api/register_ponto.php'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer  app_2bcd0ea6e9e01d52a390a142f92d6e4dc8c1a6b370cd7f47babe75eae978aadb',
      },
      body: jsonEncode({'cadastros': cadastros}),
    );

    if (response.statusCode == 200) {
      print('Dados enviados com sucesso!');
      return true;
    } else {
      print('Erro ao enviar: ${response.statusCode}');
      print(response.body);
      return false;
    }
  } catch (e) {
    print('Erro: $e');
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
