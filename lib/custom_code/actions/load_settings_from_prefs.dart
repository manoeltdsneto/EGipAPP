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
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> loadSettingsFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  final settingsJson = prefs.getString("settings_json");
  if (settingsJson == null) return false;

  final s = jsonDecode(settingsJson);

  FFAppState().update(() {
    FFAppState().settings = SettingsStruct(
      uid: s['uid'],
      idMunicipio: int.tryParse(s['id_municipio'].toString()) ?? 0,
      municipio: s['municipio'],
      codMunicipio: s['cod_municipio'],
      url: s['url'],
      token: s['token'],
    );
  });

  return true;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
