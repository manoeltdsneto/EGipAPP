import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'detalhe_censo_widget.dart' show DetalheCensoWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetalheCensoModel extends FlutterFlowModel<DetalheCensoWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - buscarPontosDaRota] action in Icon widget.
  List<dynamic>? pontoToJson;
  // Stores action output result for [Custom Action - buscarLuminariasDoPonto] action in Row widget.
  int? index;
  // Stores action output result for [Backend Call - SQLite (SelecionarLuminariasById)] action in Row widget.
  List<SelecionarLuminariasByIdRow>? retorno;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
