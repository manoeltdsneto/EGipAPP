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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

// Substitua com sua URL real da API:
const String apiUrl = 'https://egip.com.br/api/buscarPontos.php';
const String token =
    'app_2bcd0ea6e9e01d52a390a142f92d6e4dc8c1a6b370cd7f47babe75eae978aadb';

Future<bool> sincronizarPontosComApi() async {
  try {
    final municipio = FFAppState().municipioEmAtucao; // AppState
    final response = await http.get(
      Uri.parse('$apiUrl?cod_municipio=$municipio'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> dados = json.decode(response.body);

      final db = await openDatabase('bdcoletor.db');
      await db.transaction((txn) async {
        for (var ponto in dados) {
          await txn.insert(
            'pontos',
            {
              'id': ponto['id'],
              'idd': ponto['idd'],
              'id_ponto': ponto['id_ponto'],
              'municipio': ponto['municipio'],
              'cod_municipio': ponto['cod_municipio'],
              'sequencia': ponto['sequencia'],
              'transformador': ponto['transformador'],
              'chave': ponto['chave'],
              'posicao': ponto['posicao'],
              'endereco': ponto['endereco'],
              'bairro': ponto['bairro'],
              'acervo_poste': ponto['acervo_poste'],
              'medicao': ponto['medicao'],
              'medidor_nc': ponto['medidor_nc'],
              'localizacao': ponto['localizacao'],
              'tipo_lampada': ponto['tipo_lampada'],
              'potencia': ponto['potencia'],
              'tipo_luminaria': ponto['tipo_luminaria'],
              'tipo_rede': ponto['tipo_rede'],
              'fase_ligacao': ponto['fase_ligacao'],
              'id_pm_placa': ponto['id_pm_placa'],
              'medidor_referencia': ponto['medidor_referencia'],
              'latitude': ponto['latitude'],
              'longitude': ponto['longitude'],
              'zona': ponto['zona'],
              'observacao': ponto['observacao'],
              'circuito_exclusivo': ponto['circuito_exclusivo'],
              'rele_fotoeletrico': ponto['rele_fotoeletrico'],
              'recenseado': ponto['recenseado'],
              'imagens': ponto['imagens'],
            },
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      });

      return true;
    } else {
      debugPrint('Erro na API: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    debugPrint('Erro ao sincronizar: $e');
    return false;
  }
}
