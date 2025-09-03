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

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<bool> sincronizarDeletadosServidorParaApp() async {
  try {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bdcoletor.db');
    final db = await openDatabase(path);

    final baseUrl = 'https://egip.com.br/api/buscar_deletados.php';

    // 1. Buscar deletados para excluir localmente
    final response = await http.get(
      Uri.parse('$baseUrl?type=deleteApp'),
      headers: {
        'Authorization':
            'Bearer app_2bcd0ea6e9e01d52a390a142f92d6e4dc8c1a6b370cd7f47babe75eae978aadb',
      },
    );

    if (response.statusCode != 200) return false;

    final dados = jsonDecode(response.body);
    final deletados = dados['deletados'];

    for (final deletado in deletados) {
      final id = int.tryParse(deletado['id'].toString());
      if (id != null) {
        await db.delete('pontos', where: 'id = ?', whereArgs: [id]);
      }
    }

    // 2. Agora deletar no servidor também
    await http.get(
      Uri.parse('$baseUrl?type=deleteServidor'),
      headers: {
        'Authorization':
            'Bearer app_2bcd0ea6e9e01d52a390a142f92d6e4dc8c1a6b370cd7f47babe75eae978aadb',
      },
    );

    return true;
  } catch (e) {
    print('Erro na sincronização de deletados: $e');
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
