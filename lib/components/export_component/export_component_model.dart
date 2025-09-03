import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'export_component_widget.dart' show ExportComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExportComponentModel extends FlutterFlowModel<ExportComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - readCadastroAsCSV] action in Container widget.
  String? listaASCSV;
  // Stores action output result for [Custom Action - saveCSVFile] action in Container widget.
  String? path02;
  // Stores action output result for [Custom Action - readCadastroAsCSV] action in Container widget.
  String? pathPdf;
  // Stores action output result for [Custom Action - convertCSVToPDF] action in Container widget.
  String? convertCSVToPDF;
  // Stores action output result for [Custom Action - readCadastroAsCSV] action in Container widget.
  String? pathPdfF;
  // Stores action output result for [Custom Action - convertCSVToPDFF] action in Container widget.
  String? convertCSVToPDFF;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
