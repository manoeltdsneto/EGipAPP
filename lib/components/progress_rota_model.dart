import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'progress_rota_widget.dart' show ProgressRotaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ProgressRotaModel extends FlutterFlowModel<ProgressRotaWidget> {
  ///  Local state fields for this component.

  int concluidos = 0;

  int total = 0;

  double percent = 0.0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - contarPontosRecenseadosDasRotas] action in progressRota widget.
  int? pontosConcluidos;
  // Stores action output result for [Custom Action - contarPontosUnicosDasRotas] action in progressRota widget.
  int? totalPontos;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
