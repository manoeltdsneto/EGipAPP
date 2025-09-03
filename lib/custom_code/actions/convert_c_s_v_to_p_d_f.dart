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
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

Future<String> convertCSVToPDF(String csvContent) async {
  final pdf = pw.Document();

  final lines =
      csvContent.split('\n').where((line) => line.trim().isNotEmpty).toList();
  if (lines.isEmpty) {
    pdf.addPage(pw.Page(
      build: (pw.Context context) => pw.Center(child: pw.Text('Sem dados.')),
    ));
  } else {
    final headers = lines.first.split(',');
    final dataRows = lines.sublist(1).map((line) => line.split(',')).toList();

    pdf.addPage(pw.MultiPage(
      build: (pw.Context context) => [
        pw.Table.fromTextArray(
          headers: headers,
          data: dataRows,
        ),
      ],
    ));
  }

  final dir = await getApplicationDocumentsDirectory();
  final path = '${dir.path}/cadastro.pdf';
  final file = File(path);
  await file.writeAsBytes(await pdf.save());

  return path;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
