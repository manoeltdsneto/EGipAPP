import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'detalhecenso_widget.dart' show DetalhecensoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetalhecensoModel extends FlutterFlowModel<DetalhecensoWidget> {
  ///  Local state fields for this component.

  int concluido = 0;

  int totalPontos = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - contarPontosRecenseadosDasRotas] action in detalhecenso widget.
  int? concluidos;
  // Stores action output result for [Custom Action - contarPontosUnicosDasRotas] action in detalhecenso widget.
  int? total;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
