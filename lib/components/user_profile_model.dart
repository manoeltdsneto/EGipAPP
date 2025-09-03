import '/auth/custom_auth/auth_util.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  Local state fields for this component.

  int concluidos = 0;

  int total = 0;

  double percent = 0.0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - contarPontosSQLite] action in userProfile widget.
  int? totalPontosSqlite;
  // Stores action output result for [Backend Call - SQLite (pontosConcluido)] action in userProfile widget.
  List<PontosConcluidoRow>? pontosConcluido;
  // Stores action output result for [Custom Action - contarPontosRecenseadosDasRotas] action in userProfile widget.
  int? pontosConcluidos;
  // Stores action output result for [Custom Action - contarPontosUnicosDasRotas] action in userProfile widget.
  int? totalPontos;
  // Stores action output result for [Backend Call - SQLite (quantidadeRegistroPonto)] action in userProfile widget.
  List<QuantidadeRegistroPontoRow>? totalDePontos;
  // Stores action output result for [Custom Action - getGlobalProgress] action in userProfile widget.
  List<int>? progress;
  // Stores action output result for [Custom Action - sincronizarTudo] action in Button widget.
  bool? sincronizacao;
  // Stores action output result for [Custom Action - exportPontosToSql] action in Container widget.
  String? export;
  // Stores action output result for [Custom Action - exportTodosPontosToSql] action in Container widget.
  String? exportarTodosPontos;
  // Stores action output result for [Custom Action - exportarPontoFila] action in Container widget.
  String? exportarPontoFila;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
