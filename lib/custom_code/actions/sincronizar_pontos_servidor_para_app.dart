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

Future<bool> sincronizarPontosServidorParaApp() async {
  try {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bdcoletor.db');
    final db = await openDatabase(path);
    final urlBase = FFAppState().settings.url ?? '';
    final token = FFAppState().settings.token ?? '';

    final id = FFAppState().userLogado.id;
    final ultimaSync = FFAppState().ultimaSincronizacao; // AppState
    final since = (ultimaSync == null || ultimaSync.isEmpty)
        ? '2020-01-01 00:00:00'
        : ultimaSync;

    final url = Uri.parse(
      '${urlBase}enviar_postes_para_app.php?since=$since&usuario_id=$id',
    );

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      print('Erro HTTP: ${response.statusCode}');
      return false;
    }

    final jsonBody = json.decode(response.body);

    if (jsonBody == null || jsonBody['dados'] == null) {
      print('Resposta inválida da API');
      return false;
    }

    final dados = jsonBody['dados'];

    //FFAppState().logs.add('dados vindo do servidor $dados');

    // Campos válidos para pontos
    final camposValidosPonto = [
      'id',
      'idd',
      'id_ponto',
      'municipio',
      'cod_municipio',
      'sequencia',
      'transformador',
      'chave',
      'posicao',
      'endereco',
      'bairro',
      'acervo_poste',
      'medicao',
      'medidor_nc',
      'localizacao',
      'tipo_lampada',
      'potencia',
      'tipo_luminaria',
      'fabricante_luminaria',
      'tipo_rede',
      'fase_ligacao',
      'id_pm_placa',
      'medidor_referencia',
      'latitude',
      'longitude',
      'zona',
      'observacao',
      'circuito_exclusivo',
      'rele_fotoeletrico',
      'recenseado',
      'imagens',
      'laudo_tecnico',
      'updated_at',
    ];

    // Campos válidos para luminarias (exemplo, ajuste conforme seu schema)
    final camposValidosLuminaria = [
      'id',
      'ponto_id', // FK para o ponto
      'tipo_luminaria',
      'fabricante',
      'potencia',
      'estado',
      'latitude',
      'longitude',
      'updated_at',
    ];

    // Transação para garantir atomicidade da operação
    await db.transaction((txn) async {
      for (var ponto in dados) {
        // Filtra campos do ponto
        final dadosFiltradosPonto = <String, dynamic>{};
        for (final campo in camposValidosPonto) {
          if (ponto.containsKey(campo)) {
            dadosFiltradosPonto[campo] = ponto[campo];
          }
        }

        // Verifica se ponto existe
        final List<Map<String, dynamic>> existePonto = await txn.query(
          'pontos',
          where: 'id = ?',
          whereArgs: [ponto['id']],
        );

        if (existePonto.isNotEmpty) {
          await txn.update(
            'pontos',
            dadosFiltradosPonto,
            where: 'id = ?',
            whereArgs: [ponto['id']],
          );
        } else {
          await txn.insert('pontos', dadosFiltradosPonto);
        }

        // Agora processa as luminárias do ponto
        if (ponto.containsKey('luminarias') && ponto['luminarias'] is List) {
          List<dynamic> luminarias = ponto['luminarias'];

          for (var luminaria in luminarias) {
            final dadosFiltradosLuminaria = <String, dynamic>{};

            for (final campo in camposValidosLuminaria) {
              if (luminaria.containsKey(campo)) {
                dadosFiltradosLuminaria[campo] = luminaria[campo];
              }
            }

            // Importante: Garantir que tenha o campo 'ponto_id' vinculando à FK do ponto
            dadosFiltradosLuminaria['ponto_id'] = ponto['id'];

            // Verifica se luminaria existe (assumindo chave primária 'id')
            final List<Map<String, dynamic>> existeLum = await txn.query(
              'luminarias',
              where: 'id = ?',
              whereArgs: [luminaria['id']],
            );

            if (existeLum.isNotEmpty) {
              await txn.update(
                'luminarias',
                dadosFiltradosLuminaria,
                where: 'id = ?',
                whereArgs: [luminaria['id']],
              );
            } else {
              await txn.insert('luminarias', dadosFiltradosLuminaria);
            }
          }
        }
      }
    });

    return true;
  } catch (e) {
    print('Erro na sincronização: $e');
    return false;
  }
}
