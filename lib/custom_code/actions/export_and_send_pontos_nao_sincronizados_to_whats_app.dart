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

// name: exportAndSendPontosNaoSincronizadosToWhatsApp
// description: Exporta pontos onde sincronizado = 0 para .sql e envia o arquivo como documento via WhatsApp API.
// inputs: phone (String), instanceId (String), token (String)
// output: bool (true se enviado com sucesso, false caso contrário)

import 'dart:io';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

// Helpers
String _formatDateTime(DateTime dt) {
  String two(int n) => n.toString().padLeft(2, '0');
  return '${dt.year}-${two(dt.month)}-${two(dt.day)}_${two(dt.hour)}-${two(dt.minute)}-${two(dt.second)}';
}

String _sqlEscape(String s) => s.replaceAll("'", "''");
String _toSqlLiteral(dynamic v) {
  if (v == null) return 'NULL';
  if (v is num) return v.toString();
  if (v is bool) return v ? '1' : '0';
  return "'${_sqlEscape(v.toString())}'";
}

Future<bool> exportAndSendPontosNaoSincronizadosToWhatsApp(
  String phone,
  String instanceId,
  String token,
) async {
  final Database db = await SQLiteManager.instance.database;

  final nome = FFAppState().userLogado.nome;
  // Pega colunas
  final pragma = await db.rawQuery('PRAGMA table_info(pontos)');
  if (pragma.isEmpty) throw Exception("Tabela pontos não encontrada.");
  final columns = pragma.map((m) => m['name'].toString()).toList();

  if (!columns.contains('sincronizado')) {
    throw Exception("Coluna sincronizado não existe na tabela pontos.");
  }

  // Busca pontos não sincronizados
  final rows =
      await db.query('pontos', where: 'sincronizado = ?', whereArgs: [0]);

  final buf = StringBuffer();
  buf.writeln(
      '-- Dump tabela `pontos` gerado em ${DateTime.now().toIso8601String()}');
  buf.writeln('-- Filtro: sincronizado = 0');
  buf.writeln('BEGIN TRANSACTION;');

  final colsJoined = columns.map((c) => '"$c"').join(', ');

  if (rows.isEmpty) {
    buf.writeln('-- Nenhum registro encontrado.');
  } else {
    for (final row in rows) {
      final values = columns.map((c) => _toSqlLiteral(row[c])).join(', ');
      buf.writeln('INSERT INTO "pontos" ($colsJoined) VALUES ($values);');
    }
  }

  buf.writeln('COMMIT;');

  // Salva arquivo temporário
  final tmpDir = await getTemporaryDirectory();
  final fileName =
      '${nome}_pontos_nsync_${_formatDateTime(DateTime.now())}.sql';
  final tmpPath = '${tmpDir.path}/$fileName';
  final tmpFile = File(tmpPath);
  await tmpFile.writeAsString(buf.toString());

  // Lê o arquivo e converte para base64
  final bytes = await tmpFile.readAsBytes();
  final base64File = base64Encode(bytes);

  // Monta corpo da requisição
  final body = json.encode({
    "phone": "5588996645558", // Ex: "559199999999"
    "document": "data:application/sql;base64,$base64File",
    "extension": "sql",
    "fileName": fileName,
    "caption": "*Usuario:* $nome  - Todos os pontos editados",
    "delayMessage": 2
  });

  final url = Uri.parse(
      "https://api.w-api.app/v1/message/send-document?instanceId=$instanceId");

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: body,
  );

  print("WhatsApp API response: ${response.statusCode} - ${response.body}");

  return response.statusCode == 200;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
