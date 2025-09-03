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

Future<String> convertCSVToPDFF(String csvContent) async {
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

    // Número de colunas por grupo (por página)
    const int groupSize = 10;
    final totalGroups = (headers.length / groupSize).ceil();

    for (int i = 0; i < totalGroups; i++) {
      final start = i * groupSize;
      final end = ((i + 1) * groupSize > headers.length)
          ? headers.length
          : (i + 1) * groupSize;

      final groupHeaders = headers.sublist(start, end);
      final groupRows = dataRows.map((row) => row.sublist(start, end)).toList();

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4.landscape,
          build: (pw.Context context) => [
            pw.Text('Relatório de Cadastro - Página ${i + 1}',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Table.fromTextArray(
              headers: groupHeaders,
              data: groupRows,
              border: pw.TableBorder.all(width: 0.5, color: PdfColors.grey),
              headerStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, color: PdfColors.white),
              headerDecoration: pw.BoxDecoration(color: PdfColors.blueGrey800),
              cellStyle: pw.TextStyle(fontSize: 9),
              cellAlignment: pw.Alignment.centerLeft,
              headerAlignment: pw.Alignment.centerLeft,
              cellHeight: 28,
            ),
          ],
        ),
      );
    }
  }

  final dir = await getApplicationDocumentsDirectory();
  final path = '${dir.path}/cadastro_dividido.pdf';
  final file = File(path);
  await file.writeAsBytes(await pdf.save());

  return path;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
