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

// name: exportTodosPontosToSql
// description: Exporta todos registros da tabela 'pontos' para um arquivo .sql (INSERTs) e salva via picker do sistema.
// inputs: none
// output: String?  (URI/identificador salvo ou null se cancelado)

import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import '/backend/sqlite/sqlite_manager.dart'; // gerado pelo FlutterFlow

// ---------- helpers ----------
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

Future<String?> exportTodosPontosToSql() async {
  // 1) Abre o DB
  final Database db = await SQLiteManager.instance.database;

  // 2) Colunas da tabela
  final pragma = await db.rawQuery('PRAGMA table_info(pontos)');
  if (pragma.isEmpty) {
    throw Exception("Tabela 'pontos' não encontrada.");
  }
  final List<String> columns = pragma.map((m) => m['name'].toString()).toList();

  // 3) Buscar todos os registros (sem filtro)
  final List<Map<String, dynamic>> rows = await db.query('pontos');

  // 4) Monta o dump SQL
  final StringBuffer buf = StringBuffer();
  buf.writeln(
      '-- Dump da tabela `pontos` gerado em ${DateTime.now().toIso8601String()}');
  buf.writeln('-- Exportando todos os registros da tabela');
  buf.writeln('BEGIN TRANSACTION;');

  final colsJoined = columns.map((c) => '"$c"').join(', ');

  if (rows.isEmpty) {
    buf.writeln('-- Nenhum registro encontrado na tabela pontos.');
  } else {
    for (final row in rows) {
      final values = columns.map((c) => _toSqlLiteral(row[c])).join(', ');
      buf.writeln('INSERT INTO "pontos" ($colsJoined) VALUES ($values);');
    }
  }

  buf.writeln('COMMIT;');

  // 5) Arquivo temporário
  final tmpDir = await getTemporaryDirectory();
  final fileName = 'pontos_all_${_formatDateTime(DateTime.now())}.sql';
  final tmpPath = '${tmpDir.path}/$fileName';
  final tmpFile = File(tmpPath);
  await tmpFile.writeAsString(buf.toString());

  // 6) Salvar via picker (Downloads/Arquivos)
  final savedUri = await FlutterFileDialog.saveFile(
    params: SaveFileDialogParams(
      sourceFilePath: tmpPath,
      fileName: fileName,
      mimeTypesFilter: const ['application/sql', 'text/plain'],
    ),
  );

  return savedUri; // null se cancelado
}
