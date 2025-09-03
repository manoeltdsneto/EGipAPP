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

import 'package:sqflite/sqflite.dart';

Future<int> buscarLuminariasDoPonto(int pontoId) async {
  final Database db = await SQLiteManager.instance.database;

  try {
    final result = await db.query(
      'luminarias',
      where: 'ponto_id = ?',
      whereArgs: [pontoId],
    );

    // Limpa AppState atual
    FFAppState().luminarias = [];

    // Adiciona cada luminária encontrada
    for (final row in result) {
      FFAppState().luminarias.add(LuminariasStruct(
            idd: row['idd']?.toString() ?? '',
            tipoLampada: row['tipo_lampada']?.toString() ?? '',
            tipoLuminaria: row['tipo_luminaria']?.toString() ?? '',
            potencia: row['potencia']?.toString() ?? '',
            fabricanteLuminaria: row['fabricante_luminaria']?.toString() ?? '',
          ));
    }

    // Retorna quantidade de luminárias encontradas
    return result.length;
  } catch (e) {
    print('Erro ao buscar luminárias: $e');
    return 0;
  }
}
