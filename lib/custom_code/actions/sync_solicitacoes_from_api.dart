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

Future<void> syncSolicitacoesFromApi() async {
  final db = await SQLiteManager.instance.database;
  final urlBase = FFAppState().settings.url ?? '';
  final token = FFAppState().settings.token ?? '';
  final idMunicipio = FFAppState().settings.idMunicipio ?? '';

  final url = Uri.parse(
    '${urlBase}solicitacoes.php?municipio_id=$idMunicipio',
  );

  final response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  });

  if (response.statusCode == 200) {
    final List<dynamic> dados = jsonDecode(response.body);
    FFAppState().logs.add("dados: $dados");

    for (final item in dados) {
      // --- 1. Inserir/atualizar solicitação ---
      await db.insert(
        'solicitacoes',
        {
          "id": item["id"],
          "tipo": item["tipo"],
          "prioridade": item["prioridade"],
          "referencia": item["referencia"],
          "observacoes": item["observacoes"],
          "data_abertura": item["data_abertura"],
          "data_conclusao": item["data_conclusao"],
          "status": item["status"],
          "municipio_id": item["municipio_id"],
          "ponto_id": item["ponto_id"],
          "responsavel": item["responsavel"],
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      // --- 2. Inserir/atualizar ponto ---
      final ponto = item["ponto"];
      if (ponto != null) {
        await db.insert(
          'pontos',
          {
            "id": ponto["id"],
            "idd": ponto["idd"],
            "id_ponto": ponto["id_ponto"],
            "municipio": ponto["municipio"],
            "cod_municipio": ponto["cod_municipio"],
            "sequencia": ponto["sequencia"],
            "transformador": ponto["transformador"],
            "chave": ponto["chave"],
            "posicao": ponto["posicao"],
            "endereco": ponto["endereco"],
            "bairro": ponto["bairro"],
            "acervo_poste": ponto["acervo_poste"],
            "medicao": ponto["medicao"],
            "medidor_nc": ponto["medidor_nc"],
            "localizacao": ponto["localizacao"],
            "tipo_lampada": ponto["tipo_lampada"],
            "potencia": ponto["potencia"],
            "tipo_luminaria": ponto["tipo_luminaria"],
            "fabricante_luminaria": ponto["fabricante_luminaria"],
            "tipo_rede": ponto["tipo_rede"],
            "fase_ligacao": ponto["fase_ligacao"],
            "id_pm_placa": ponto["id_pm_placa"],
            "medidor_referencia": ponto["medidor_referencia"],
            "utm_x": ponto["utm_x"],
            "utm_y": ponto["utm_y"],
            "latitude": ponto["latitude"],
            "longitude": ponto["longitude"],
            "zona": ponto["zona"],
            "observacao": ponto["observacao"],
            "circuito_exclusivo": ponto["circuito_exclusivo"],
            "rele_fotoeletrico": ponto["rele_fotoeletrico"],
            //"medido": ponto["medido"],
            "recenseado": ponto["recenseado"],
            "data_recenseamento": ponto["data_recenseamento"],
            "tipo_poste": ponto["tipo_poste"],
            "altura_poste": ponto["altura_poste"],
            "tamanho_braco": ponto["tamanho_braco"],
            "laudo_tecnico": ponto["laudo_tecnico"],
            "historico": ponto["historico"],
            // "timeline": ponto["timeline"],
            "manutencoes": ponto["manutencoes"],
            //"imagens": ponto["imagens"],
            "alteracoes": ponto["alteracoes"],
            //"anexos": ponto["anexos"],
            "responsavel": ponto["responsavel"],
            "ponto_novo": ponto["ponto_novo"],
            "data_cadastro": ponto["data_cadastro"],
            "cadastrado_por": ponto["cadastrado_por"],
            "updated_at": ponto["updated_at"],
            "is_deleted": ponto["is_deleted"],
            "deleted_at": ponto["deleted_at"],
            //"status": ponto["status"], // cuidado: pode conflitar com status da solicitação
            //"sincronizado": ponto["sincronizado"],
            //"rota_id": ponto["rota_id"],
            "municipio_id": ponto["municipio_id"],
            "alterado": ponto["alterado"],
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    }
  } else {
    FFAppState().logs.add(
          "Erro API solicitacoes.php idMunicipio: $idMunicipio -> [${response.statusCode}] => ${response.body}",
        );
    throw Exception("Erro ao buscar solicitações da API");
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
