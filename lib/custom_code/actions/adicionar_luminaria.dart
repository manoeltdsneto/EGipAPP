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

Future<bool> adicionarLuminaria(
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
  String? idd,
  String? tipoLuminaria,
  String? tipoLampada,
  String? potencia,
  String? fabricanteLuminaria,
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
) async {
  final Database db = await SQLiteManager.instance.database;

  // 🔒 Validação: idd obrigatório
  final String? iddNorm = idd?.trim();
  if (iddNorm == null || iddNorm.isEmpty) {
    FFAppState().logs.add('Erro: idd é obrigatório');
    return false;
  }

  // 🚫 Não permitir duplicado de idd (não deletado)
  final exists = await db.query(
    'pontos',
    where: 'idd = ? AND (is_deleted IS NULL OR is_deleted = 0)',
    whereArgs: [iddNorm],
    limit: 1,
  );
  if (exists.isNotEmpty) {
    FFAppState().logs.add('Duplicado: já existe luminária com idd=$iddNorm');
    return false;
  }

  final data = {
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
    'idd': iddNorm,
    'tipo_luminaria': tipoLuminaria,
    'tipo_lampada': tipoLampada,
    'potencia': potencia,
    'fabricante_luminaria': fabricanteLuminaria,
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
    'data_recenseamento': DateTime.now().toIso8601String(),
    'ponto_novo': 'SIM',
    'imagens': imagens,
    'laudo_tecnico': laudoTecnico,
    'sincronizado': 0,
    'updated_at': DateTime.now().toIso8601String(),
    // Se usar soft-delete:
    // 'is_deleted': 0,
  };

  try {
    // 💡 Além da checagem acima, reforçamos com UNIQUE INDEX (ver seção 1)
    // Assim, se outro fluxo tentar inserir o mesmo idd, o insert será ignorado.
    await db.insert(
      'pontos',
      data,
      conflictAlgorithm: ConflictAlgorithm.abort, // aborta se violar UNIQUE
    );

    //FFAppState().logs.add('Luminária cadastrada (idd=$iddNorm)');
    return true;
  } on DatabaseException catch (e) {
    // Se bater no UNIQUE INDEX, tratamos como duplicado
    if (e.isUniqueConstraintError()) {
      FFAppState().logs.add('Duplicado (índice único): idd=$iddNorm');
      return false;
    }
    FFAppState().logs.add('Erro SQLite: ${e.toString()}');
    return false;
  } catch (e) {
    FFAppState().logs.add('Erro: $e');
    return false;
  }
}
