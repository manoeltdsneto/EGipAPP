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

Future<void> sincronizarDeletados(String lastSyncDate) async {
  final String apiUrl = 'https://egip.com.br/api';
  final String token =
      'app_2bcd0ea6e9e01d52a390a142f92d6e4dc8c1a6b370cd7f47babe75eae978aadb';

  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'bdcoletor.db');
  final db = await openDatabase(path);

  // 1. ENVIAR DELETADOS DO APP PARA O SERVIDOR
  final deletadosApp = await db.query(
    'pontos',
    where: 'is_deleted = 1',
  );

  if (deletadosApp.isNotEmpty) {
    final response = await http.post(
      Uri.parse('$apiUrl/deletar_pontos.php'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'registros': deletadosApp}),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao enviar deletados ao servidor');
    }

    // Se deletou com sucesso no servidor, deletar do SQLite
    for (final item in deletadosApp) {
      await db.delete(
        'pontos',
        where: 'id = ?',
        whereArgs: [item['id']],
      );
    }
  }

  // 2. BUSCAR DELETADOS DO SERVIDOR E DELETAR DO APP
  final responseDownload = await http.get(
    Uri.parse('$apiUrl/buscar_deletados.php?last_sync=$lastSyncDate'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (responseDownload.statusCode != 200) {
    throw Exception('Erro ao buscar deletados do servidor');
  }

  final dados = jsonDecode(responseDownload.body);
  final deletadosServidor = dados['deletados'] as List<dynamic>;

  for (final deletado in deletadosServidor) {
    await db.delete(
      'pontos',
      where: 'id = ?',
      whereArgs: [deletado['id']],
    );
  }

  await db.close();
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
