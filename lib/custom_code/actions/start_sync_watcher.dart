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

import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

// 👉 Helper interno: chama sua Custom Action existente que envia tudo e marca sincronizado=1
Future<void> syncOutbox({required Database db}) async {
  // Chama sua Custom Action já pronta:
  await exportAndSendPontosNaoSincronizadosToWhatsApp('5588996645558',
      '1DNVHD-MVKIU9-JFA7U2', 'JwyDLZFGcg1mR3kdwqqkbxJ3MsTquw9ha');

  await sincronizarPonto(
      FFAppState().userLogado.id); // <- sincroniza pontos para o servidor
  //await sincronizarPontosServidorParaApp(); // sincroniza pontos servidor para app
}

class _SyncWatcher {
  static Timer? _timer;
  static bool _running = false;
  static bool _started = false;
  static int _intervalSec = 60; // intervalo atual
  static const int _minSec = 30; // mínimo
  static const int _maxSec = 900; // máximo (15 min)

  static Future<bool> _hasInternet() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) return false;
    try {
      final res = await InternetAddress.lookup('one.one.one.one')
          .timeout(const Duration(seconds: 2));
      return res.isNotEmpty && res.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  static Future<int> _countPendentes(Database db) async {
    final r = await db.rawQuery(
        'SELECT COUNT(*) as c FROM pontos WHERE sincronizado = 0 AND (is_deleted IS NULL OR is_deleted = 0)');
    final v = r.first['c'];
    if (v is int) return v;
    if (v is num) return v.toInt();
    return Sqflite.firstIntValue(r) ?? 0;
  }

  static void _scheduleTimer(Database db) {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: _intervalSec), (_) async {
      if (_running) return;
      _running = true;
      try {
        final pend = await _countPendentes(db);
        if (pend == 0) {
          _intervalSec = (_intervalSec * 2).clamp(_minSec, _maxSec);
          _scheduleTimer(db);
          return;
        }

        final online = await _hasInternet();
        if (!online) return;

        await syncOutbox(db: db);

        // sucesso → volta ao mínimo
        _intervalSec = _minSec;
        _scheduleTimer(db);
      } catch (e) {
        // erro → backoff
        _intervalSec = (_intervalSec * 2).clamp(_minSec, _maxSec);
        _scheduleTimer(db);
      } finally {
        _running = false;
      }
    });
  }

  static Future<bool> start({required Database db}) async {
    if (_started) return false;
    _started = true;
    _intervalSec = _minSec; // começa curto
    _scheduleTimer(db);
    return true;
  }

  static void stop() {
    _timer?.cancel();
    _timer = null;
    _started = false;
    _running = false;
    _intervalSec = _minSec;
  }
}

/// 🔹 ESTA é a função exposta da Custom Action (nome da ação =
/// startSyncWatcher)
Future<bool> startSyncWatcher() async {
  final db = await SQLiteManager.instance.database;
  return _SyncWatcher.start(db: db);
}
