import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'pontos_widget.dart' show PontosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PontosModel extends FlutterFlowModel<PontosWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (quantidadeRegistroPonto)] action in pontos widget.
  List<QuantidadeRegistroPontoRow>? quantidadePontos;
  // Stores action output result for [Custom Action - contarPontosUnicosDasRotas] action in pontos widget.
  int? total;
  // Stores action output result for [Custom Action - todosOsPontos] action in pontos widget.
  List<dynamic>? listaJs;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
