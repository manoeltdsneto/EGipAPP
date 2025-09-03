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

// name: verifyAndLoadAppByBearer
// description: Verifica o código na API, baixa as configs e salva no FFAppState e SharedPreferences.
// inputs: tokenCode (String)
// output: bool

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> verifyAndLoadAppByBearer(String tokenCode) async {
  try {
    // 🔧 Configuração fixa da sua API
    const String apiBaseUrl = "https://egip.com.br/api/";
    const String endpointPath = "aplicativo_atual.php";

    final url = Uri.parse("$apiBaseUrl$endpointPath");

    final resp = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${tokenCode.trim()}',
        'Accept': 'application/json',
      },
    );

    if (resp.statusCode != 200) {
      return false;
    }

    final decoded = jsonDecode(resp.body);

    dynamic s;
    if (decoded is Map<String, dynamic>) {
      if (decoded.containsKey('settings')) {
        s = decoded['settings'];
      } else if (decoded.containsKey('data')) {
        s = decoded['data'];
      } else {
        s = decoded;
      }
    }

    if (s == null || s is! Map) return false;

    // Extrai valores
    String? uid = s['uid']?.toString();
    int idMunicipio = int.tryParse(s['id_municipio']?.toString() ?? '0') ?? 0;
    String? municipio = s['municipio']?.toString();
    String? codMunicipio = s['cod_municipio']?.toString();
    String? urlBase = s['url']?.toString();
    String? tokenFinal = s['token']?.toString() ?? tokenCode;

    if (idMunicipio == 0 ||
        municipio == null ||
        codMunicipio == null ||
        urlBase == null) {
      return false;
    }

    // Salva no AppState (sessão atual)
    FFAppState().update(() {
      FFAppState().settings = SettingsStruct(
        uid: uid,
        idMunicipio: idMunicipio,
        municipio: municipio,
        codMunicipio: int.tryParse(codMunicipio ?? ''),
        url: urlBase,
        token: tokenFinal,
      );
    });

    // Salva também no SharedPreferences (persistente)
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        "settings_json",
        jsonEncode({
          "uid": uid,
          "id_municipio": idMunicipio,
          "municipio": municipio,
          "cod_municipio": codMunicipio,
          "url": urlBase,
          "token": tokenFinal,
        }));

    return true;
  } catch (e) {
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
