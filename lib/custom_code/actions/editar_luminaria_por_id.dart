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

Future<void> editarLuminariaPorId(
  int id,
  String idd,
  String? tipoLuminaria,
  String? tipoLampada,
  String? potencia,
  String? fabricanteLuminaria,
  String? responsavel,
) async {
  final Database db = await SQLiteManager.instance.database;

  // Buscar dados antigos
  final pontoList =
      await db.query('pontos', where: 'id = ?', whereArgs: [id], limit: 1);
  if (pontoList.isEmpty) return;

  final antigo = pontoList.first;

  // Map dos novos valores
  final novosCampos = {
    'idd': idd,
    'tipo_luminaria': tipoLuminaria,
    'tipo_lampada': tipoLampada,
    'potencia': potencia,
    'fabricante_luminaria': fabricanteLuminaria,
  };

  // Detectar alterações
  final Map<String, dynamic> alteracoes = {};
  novosCampos.forEach((campo, novoValor) {
    final antigoValor = antigo[campo]?.toString().trim();
    final novo = novoValor?.toString().trim();

    if (antigoValor != novo) {
      alteracoes[campo] = {
        'antes': antigoValor,
        'depois': (novo == null || novo.isEmpty) ? false : novo
      };
    }
  });

  // Recuperar histórico anterior
  List<dynamic> historico = [];
  final alteracoesAntigas = antigo['alteracoes'];
  if (alteracoesAntigas != null &&
      alteracoesAntigas.toString().trim().isNotEmpty) {
    try {
      historico = jsonDecode(alteracoesAntigas.toString());
    } catch (_) {}
  }

  // Adicionar novo log, se houve alteração
  if (alteracoes.isNotEmpty) {
    historico.add({
      'data': DateTime.now().toIso8601String().split('T').first,
      'usuario': responsavel,
      'alteracoes': alteracoes,
    });
  }

  // Atualizar registro
  await db.update(
    'pontos',
    {
      ...novosCampos,
      'updated_at': DateTime.now().toIso8601String(),
      'sincronizado': 0,
      'alteracoes': jsonEncode(historico),
    },
    where: 'id = ?',
    whereArgs: [id],
  );
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
