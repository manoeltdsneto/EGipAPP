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
import 'package:intl/intl.dart';

Future<bool> editarPontos(
    String idPonto,
    String municipio,
    int codMunicipio,
    String sequencia,
    String transformador,
    String chave,
    String posicao,
    String endereco,
    String bairro,
    String acervoPoste,
    String medicao,
    String medidorNC,
    String localizacao,
    String tipoRede,
    String faseLigacao,
    String idPmPlaca,
    String medidorReferencia,
    String latitude,
    String longitude,
    String zona,
    String observacao,
    String circuitoExclusivo,
    String releFotoeletrico,
    String recenseado,
    String imagens,
    String laudoTecnico,
    String manutencoes,
    String responsavel,
    String tipoPoste,
    String alturaPoste,
    String tamanhoBraco,
    String pontoNovo,
    int municipioID,
    String lat,
    String lng) async {
  final Database db = await SQLiteManager.instance.database;

  final idUser = FFAppState().userLogado.id;

  final Map<String, dynamic> data = {
    'municipio': municipio,
    'cod_municipio': codMunicipio,
    'sequencia': sequencia,
    'transformador': transformador,
    'chave': chave,
    'posicao': posicao,
    'endereco': endereco,
    'bairro': bairro,
    'acervo_poste': acervoPoste,
    'medicao': medicao,
    'medidor_nc': medidorNC,
    'localizacao': localizacao,
    'tipo_rede': tipoRede,
    'fase_ligacao': faseLigacao,
    'id_pm_placa': idPmPlaca,
    'medidor_referencia': medidorReferencia,
    'latitude': latitude,
    'longitude': longitude,
    'zona': zona,
    'observacao': observacao,
    'circuito_exclusivo': circuitoExclusivo,
    'rele_fotoeletrico': releFotoeletrico,
    'recenseado': recenseado,
    'imagens': imagens,
    'tipo_poste': tipoPoste,
    'altura_poste': alturaPoste,
    'tamanho_braco': tamanhoBraco,
    'ponto_novo': pontoNovo,
    'laudo_tecnico': laudoTecnico,
    'municipio_id': municipioID,
    'updated_at': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
    'cadastrado_por': idUser, // ✅ adiciona o usuário que cadastrou/alterou
    'sincronizado': 0
  };

  // Adiciona data de recenseamento
  if (recenseado.trim().toUpperCase() == 'SIM') {
    data['data_recenseamento'] =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  }

  // Adiciona manutenções se existirem
  if (manutencoes.trim().isNotEmpty) {
    final manutencoesList = manutencoes
        .split(',')
        .map((servico) => {
              "data": DateTime.now().toIso8601String(),
              "tipo_servico": servico.trim(),
              "responsavel": responsavel,
            })
        .toList();

    data['manutencoes'] = jsonEncode(manutencoesList);
  }

  try {
    final antigosList = await db.query(
      'pontos',
      where: 'id_ponto = ?',
      whereArgs: [idPonto],
      limit: 1,
    );

    if (antigosList.isEmpty) {
      print('⚠️ Ponto não encontrado com id_ponto = $idPonto');
      return false;
    }

    final antigo = antigosList.first;
    final antigoMedicao = antigo['medicao']?.toString().trim();
    final novoMedicao = medicao.trim();

    Map<String, dynamic> novaAlteracao = {};
    if (antigoMedicao != novoMedicao) {
      novaAlteracao = {
        'data': DateTime.now().toIso8601String().split('T').first,
        'usuario': responsavel,
        'alteracoes': {
          'medicao': {
            'antes': antigoMedicao,
            'depois': novoMedicao.isEmpty ? false : novoMedicao,
          }
        }
      };
    }

    List<dynamic> historico = [];
    final alteracoesAntigas = antigo['alteracoes'];
    if (alteracoesAntigas != null &&
        alteracoesAntigas.toString().trim().isNotEmpty) {
      try {
        final parsed = jsonDecode(alteracoesAntigas.toString());
        if (parsed is List) historico = parsed;
      } catch (_) {}
    }

    if (novaAlteracao.isNotEmpty) {
      historico.add(novaAlteracao);
      data['alteracoes'] = jsonEncode(historico);
    }

    // ✅ NOVO BLOCO PARA PREENCHER O CAMPO `alterado`
    final Map<String, dynamic> camposParaComparar = {
      'municipio': municipio,
      'cod_municipio': codMunicipio,
      'sequencia': sequencia,
      'transformador': transformador,
      'chave': chave,
      'posicao': posicao,
      'endereco': endereco,
      'bairro': bairro,
      'acervo_poste': acervoPoste,
      'medicao': medicao,
      'medidor_nc': medidorNC,
      'localizacao': localizacao,
      'tipo_rede': tipoRede,
      'fase_ligacao': faseLigacao,
      'id_pm_placa': idPmPlaca,
      'medidor_referencia': medidorReferencia,
      'latitude': latitude,
      'longitude': longitude,
      'lat': lat,
      'lng': lng,
      'zona': zona,
      'observacao': observacao,
      'circuito_exclusivo': circuitoExclusivo,
      'rele_fotoeletrico': releFotoeletrico,
      'recenseado': recenseado,
      'imagens': imagens,
      'tipo_poste': tipoPoste,
      'altura_poste': alturaPoste,
      'tamanho_braco': tamanhoBraco,
      'ponto_novo': pontoNovo,
      'laudo_tecnico': laudoTecnico,
    };

    const camposIgnorados = {'imagens'};

    final Map<String, dynamic> camposAlterados = {};

    for (final campo in camposParaComparar.keys) {
      // pula campos ignorados (ex.: imagens)
      if (camposIgnorados.contains(campo)) continue;

      final novoValor = camposParaComparar[campo]?.toString().trim();
      final antigoValor = antigo[campo]?.toString().trim();

      if (antigoValor != novoValor) {
        camposAlterados[campo] = {
          'de': antigoValor,
          'para': novoValor,
        };
      }
    }

    camposAlterados['lat'] = lat.trim();
    camposAlterados['lng'] = lng.trim();

// Salva no campo `alterado` se houver algo
    if (camposAlterados.isNotEmpty) {
      data['alterado'] = jsonEncode(camposAlterados);
    }

    final count = await db.update(
      'pontos',
      data,
      where: 'id_ponto = ?',
      whereArgs: [idPonto],
    );

    if (count > 0) {
      await db.insert(
        'fila',
        {
          ...data,
          'id_ponto': idPonto,
          'sincronizado': 0, // pendente de sincronização
          'updated_at': DateTime.now().toIso8601String(),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    print('🛠️ $count registros atualizados com id_ponto = $idPonto');
    return true;
  } catch (e) {
    print('❌ Erro ao atualizar pontos com id_ponto $idPonto: $e');
    FFAppState().logs.add('error $e');
    return false;
  }
}
