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

Future<bool> sincronizarDeletadosAppParaServidor() async {
  try {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bdcoletor.db');
    final db = await openDatabase(path);

    // Buscar registros deletados localmente
    final deletados = await db.query(
      'pontos',
      where: 'is_deleted = 1',
      columns: ['id', 'deleted_at'],
    );

    if (deletados.isEmpty) {
      print('[✓] Nenhum deletado local para enviar.');
      return true;
    }

    // Enviar para o servidor
    final response = await http.post(
      Uri.parse('https://egip.com.br/api/sincronizar_deletados_app.php'),
      headers: {
        'Authorization':
            'Bearer app_2bcd0ea6e9e01d52a390a142f92d6e4dc8c1a6b370cd7f47babe75eae978aadb',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'deletados': deletados}),
    );

    if (response.statusCode != 200) {
      print('[x] Erro ao enviar deletados: ${response.statusCode}');
      return false;
    }

    // Deletar localmente com base na mesma lista enviada
    for (final item in deletados) {
      final id = item['id'];
      await db.delete('pontos', where: 'id = ?', whereArgs: [id]);
      print('[✓] Registro ID=$id deletado localmente após envio ao servidor.');
    }

    return true;
  } catch (e) {
    print('[x] Erro ao sincronizar deletados do app para o servidor: $e');
    return false;
  }
}
