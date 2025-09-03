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

String adicionarAlteracoes(
  String? alteracoesAtuais,
  String jsonNovos,
  String jsonAntigos,
  String responsavel,
) {
  final Map<String, dynamic> novosCampos = jsonDecode(jsonNovos);
  final Map<String, dynamic> antigosCampos = jsonDecode(jsonAntigos);

  final Map<String, dynamic> alteracoesFeitas = {};

  novosCampos.forEach((campo, novoValor) {
    final antigoValor = antigosCampos[campo]?.toString().trim();
    final novo = novoValor?.toString().trim();

    if (antigoValor != novo) {
      alteracoesFeitas[campo] = {
        'antes': antigoValor,
        'depois': (novo == null || novo.isEmpty) ? false : novo,
      };
    }
  });

  List<dynamic> historico = [];
  if (alteracoesAtuais != null && alteracoesAtuais.trim().isNotEmpty) {
    try {
      final parsed = jsonDecode(alteracoesAtuais.toString());
      if (parsed is List) historico = parsed;
    } catch (_) {}
  }

  if (alteracoesFeitas.isNotEmpty) {
    historico.add({
      'data': DateTime.now().toIso8601String().split('T').first,
      'usuario': responsavel,
      'alteracoes': alteracoesFeitas,
    });
  }

  return jsonEncode(historico);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
