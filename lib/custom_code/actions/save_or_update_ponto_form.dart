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
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

Future<bool> saveOrUpdatePontoForm(
    String? idPonto,
    String? municipio,
    int? codMunicipio,
    String? sequencia,
    String? transformador,
    String? chave,
    String? posicao,
    String? endereco,
    String? bairro,
    String? acervoPoste,
    String? medicao,
    String? medidorNC,
    String? localizacao,
    String? idd1,
    String? idd2,
    String? idd3,
    String? idd4,
    String? lamp1,
    String? lamp2,
    String? lamp3,
    String? lamp4,
    String? lumi1,
    String? lumi2,
    String? lumi3,
    String? lumi4,
    String? pot1,
    String? pot2,
    String? pot3,
    String? pot4,
    String? fab1,
    String? fab2,
    String? fab3,
    String? fab4,
    String? tipoRede,
    String? faseLigacao,
    String? idPmPlaca,
    String? medidorReferencia,
    String? latitude,
    String? longitude,
    String? zona,
    String? observacao,
    String? circuitoExclusivo,
    String? releFotoeletrico,
    String? recenseado,
    String? imagens,
    String? laudoTecnico,
    int rotaID,
    int totalLuminarias,
    int municipioID,
    String tipoPoste,
    String alturaPoste,
    String tamanhoBraco,
    String pontoNovo) async {
  final Database db = await SQLiteManager.instance.database;
  List<int> novosIds = [];

  final idUser = FFAppState().userLogado.id;

  // Função auxiliar para inserir ponto
  Future<int> inserirPonto({
    required String? idd,
    required String? tipoLampada,
    required String? tipoLuminaria,
    required String? potencia,
    required String? fabricanteLuminaria,
  }) async {
    final dataPonto = {
      'id_ponto': idPonto,
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
      'idd': idd?.trim(),
      'tipo_lampada': tipoLampada?.trim(),
      'tipo_luminaria': tipoLuminaria?.trim(),
      'potencia': potencia?.trim(),
      'fabricante_luminaria': fabricanteLuminaria?.trim(),
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
      'recenseado': 'SIM',
      'data_recenseamento':
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
      'imagens': imagens,
      'laudo_tecnico': laudoTecnico,
      'sincronizado': 0,
      'updated_at': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
      'cadastrado_por': idUser, // ✅ adiciona o usuário que cadastrou/alterou
      'rota_id': rotaID,
      'municipio_id': municipioID,
      'tipo_poste': tipoPoste.toString(),
      'altura_poste': alturaPoste.toString(),
      'tamanho_braco': tamanhoBraco.toString(),
      'ponto_novo': 'SIM',
    };

    final pontoId = await db.insert('pontos', dataPonto);
    await db.insert('fila', dataPonto);
    return pontoId;
  }

  try {
    if (totalLuminarias >= 1) {
      final id1 = await inserirPonto(
        idd: idd1,
        tipoLampada: lamp1,
        tipoLuminaria: lumi1,
        potencia: pot1,
        fabricanteLuminaria: fab1,
      );
      novosIds.add(id1);
    }

    if (totalLuminarias >= 2) {
      final id2 = await inserirPonto(
        idd: idd2,
        tipoLampada: lamp2,
        tipoLuminaria: lumi2,
        potencia: pot2,
        fabricanteLuminaria: fab2,
      );
      novosIds.add(id2);
    }

    if (totalLuminarias >= 3) {
      final id3 = await inserirPonto(
        idd: idd3,
        tipoLampada: lamp3,
        tipoLuminaria: lumi3,
        potencia: pot3,
        fabricanteLuminaria: fab3,
      );
      novosIds.add(id3);
    }

    if (totalLuminarias >= 4) {
      final id4 = await inserirPonto(
        idd: idd4,
        tipoLampada: lamp4,
        tipoLuminaria: lumi4,
        potencia: pot4,
        fabricanteLuminaria: fab4,
      );
      novosIds.add(id4);
    }

    // Atualiza a tabela rotas com os novos IDs
    //final rota = await db.query('rotas', where: 'id = ?', whereArgs: [rotaID]);
    //if (rota.isNotEmpty) {
    //  final rotaAtual = rota.first;
    //  List<int> idsExistente = [];

    //  try {
    //    final jsonString = rotaAtual['pontos_ids_json']?.toString() ?? '[]';
    //    final List<dynamic> json = jsonDecode(jsonString);
    //    idsExistente =
    //        json.map((e) => int.tryParse(e.toString()) ?? 0).toList();
    //  } catch (_) {}

    //  idsExistente.addAll(novosIds);
    //  final jsonAtualizado = jsonEncode(idsExistente);

    //  await db.update(
    //    'rotas',
    //    {'pontos_ids_json': jsonAtualizado},
    //    where: 'id = ?',
    //    whereArgs: [rotaID],
    //  );
    //}

    // FFAppState().logs.add('Ponto e luminárias cadastrados com sucesso.');
    return true;
  } catch (e) {
    print('Erro ao salvar ponto/luminárias: $e');
    FFAppState().logs.add('Erro: $e');
    return false;
  }
}
