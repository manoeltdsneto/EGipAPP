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
import 'package:path/path.dart' as p;

Future<bool> sincronizarTudo(BuildContext context) async {
  try {
    // Abrir banco SQLite local
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(p.join(dbPath, 'bdcoletor.db'));

    // Verifica se a tabela está vazia
    final countResult = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM pontos'),
    );

    if (countResult == null || countResult == 0) {
      // Tabela está vazia → Executa apenas sincronizarPontosComApi()
      print('Tabela vazia. Buscando todos os dados da API...');
      await db.delete('pontos');
      //FFAppState().logs.add('Tabela vazia. Buscando todos os dados da API...');
      final fetchAll = await fetchAndStoreAll(FFAppState().userLogado.id);
      if (!fetchAll) {
        print('Erro ao enviar dados para o servidor');
        FFAppState().logs.add('fetchAllError 2');
        return false;
      }

      return true;
    }

    FFAppState().logs.add('Erro ao enviar dados para o servidor: $countResult');

    //exportaar para whatsapp
    await exportAndSendPontosNaoSincronizadosToWhatsApp('5588996645558',
        '1DNVHD-MVKIU9-JFA7U2', 'JwyDLZFGcg1mR3kdwqqkbxJ3MsTquw9ha');

    print('Tabela possui dados. Executando sincronização parcial...');

    final enviado = await sincronizarPonto(FFAppState().userLogado.id);
    //FFAppState().logs.add('sincronizarPonto: $enviado');
    if (!enviado) {
      print('Erro ao enviar dados para o servidor');
      //FFAppState().logs.add('Erro ao enviar dados para o servidor 2');

      return false;
    }

    //final recebido = await sincronizarPontosServidorParaApp();
    //if (!recebido) {
    // print('Erro ao receber dados do servidor');
    //FFAppState().logs.add('Erro ao receber dados do servidor sincronizar pontos do servidor para app');
    // return false;
    //}

    //final deletadosEnviados = await sincronizarDeletadosAppParaServidor();
    //if (!deletadosEnviados) {
    //  print('Erro ao enviar deletados do app para o servidor');
    //  FFAppState().logs.add('Erro ao enviar deletados do app para o servidor');
    //  return false;
    //}

    //final deletadosRecebidos = await sincronizarDeletadosServidorParaApp();
    //if (!deletadosRecebidos) {
    //  print('Erro ao sincronizar deletados do servidor para o app');
    //  FFAppState()
    //       .logs
    //      .add('Erro ao sincronizar deletados do servidor para o app');
    //  return false;
    //}

    //await fetchAndStoreAll(FFAppState().userLogado.id);

    final agora = DateTime.now();
    final formatado = agora.toString().split('.').first.replaceFirst('T', ' ');

    FFAppState().ultimaSincronizacao = formatado;

    return true;
  } catch (e) {
    print('Erro geral na sincronização: $e');
    //FFAppState().logs.add('error geral');
    return false;
  }
}
