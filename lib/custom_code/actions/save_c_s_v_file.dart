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

import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> saveCSVFile(String csvContent) async {
  final directory = await getApplicationDocumentsDirectory();
  final path = '${directory.path}/cadastro.csv';
  final file = File(path);
  await file.writeAsString(csvContent);
  return path;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
