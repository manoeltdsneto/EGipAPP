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

import 'package:crypto/crypto.dart';
import 'dart:convert';

String convertSenha(String senha) {
  if (senha.isEmpty) {
    return ''; // ou lance um erro se preferir
  }
  return md5.convert(utf8.encode(senha)).toString();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
