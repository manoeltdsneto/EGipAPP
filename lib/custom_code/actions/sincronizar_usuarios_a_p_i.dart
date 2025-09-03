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

Future<bool> sincronizarUsuariosAPI() async {
  try {
    final url = Uri.parse('https://egip.com.br/api/userList.php');

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
      print('Formato de dados inválido');
      return false;
    }

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bdcoletor.db');
    final db = await openDatabase(path);

    // Criar a tabela se não existir
    await db.execute('''
      CREATE TABLE IF NOT EXISTS usuarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        email TEXT,
        senha TEXT,
        municipio INTEGER,
        permissoes TEXT,
        ultimo_login TEXT
      );
    ''');

    // Deletar todos os usuários antes de inserir
    await db.delete('usuarios');

    // Inserir todos os usuários da API
    for (final user in data) {
      await db.insert(
        'usuarios',
        {
          'id': user['id'],
          'nome': user['nome'],
          'email': user['email'],
          'senha': user['senha'] ?? '',
          'municipio': user['municipio'] ?? 0,
          'permissoes': user['permissoes'] ?? '',
          'ultimo_login': user['ultimo_login'] ?? '',
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    print('Usuários sincronizados com sucesso');
    return true;
  } catch (e) {
    print('Erro na sincronização: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
