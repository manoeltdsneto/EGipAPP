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

Future<List<dynamic>> buscarPontosProximos(
  double latitude,
  double longitude,
) async {
  try {
    final db = await SQLiteManager.instance.database;

    final double raioKm = 350.0;
    final double delta = raioKm / 111.0;
    final double latMin = latitude - delta;
    final double latMax = latitude + delta;
    final double lngMin = longitude - delta;
    final double lngMax = longitude + delta;

    final result = await db.rawQuery('''
      SELECT id, idd, id_ponto, endereco, bairro, localizacao,
             latitude, longitude, potencia, recenseado, id_pm_placa
      FROM pontos
      WHERE is_deleted = 0
        AND CAST(latitude AS REAL) BETWEEN ? AND ?
        AND CAST(longitude AS REAL) BETWEEN ? AND ?
    ''', [latMin, latMax, lngMin, lngMax]);

    return List<Map<String, dynamic>>.from(result);
  } catch (e) {
    print('[x] Erro ao buscar pontos próximos: $e');
    return [];
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
