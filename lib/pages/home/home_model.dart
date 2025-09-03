import '/auth/custom_auth/auth_util.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/acao_rapida_widget.dart';
import '/components/detalhecenso_widget.dart';
import '/components/pontos_pendentes_widget.dart';
import '/components/progress_rota_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  bool solicitacoes = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (selectMunicipioByCode)] action in Home widget.
  List<SelectMunicipioByCodeRow>? municipio;
  // Stores action output result for [Backend Call - SQLite (selectMunicipioByCode)] action in Home widget.
  List<SelectMunicipioByCodeRow>? getMunicipio;
  // Stores action output result for [Custom Action - sincronizarTudo] action in Container widget.
  bool? sic;
  // Model for detalhecenso component.
  late DetalhecensoModel detalhecensoModel;
  // Model for progressRota component.
  late ProgressRotaModel progressRotaModel;
  // Model for acaoRapida component.
  late AcaoRapidaModel acaoRapidaModel;
  // Stores action output result for [Custom Action - buscarPontosDaRota] action in Button widget.
  List<dynamic>? pontosTojson;
  // Model for pontosPendentes component.
  late PontosPendentesModel pontosPendentesModel;

  @override
  void initState(BuildContext context) {
    detalhecensoModel = createModel(context, () => DetalhecensoModel());
    progressRotaModel = createModel(context, () => ProgressRotaModel());
    acaoRapidaModel = createModel(context, () => AcaoRapidaModel());
    pontosPendentesModel = createModel(context, () => PontosPendentesModel());
  }

  @override
  void dispose() {
    detalhecensoModel.dispose();
    progressRotaModel.dispose();
    acaoRapidaModel.dispose();
    pontosPendentesModel.dispose();
  }
}
