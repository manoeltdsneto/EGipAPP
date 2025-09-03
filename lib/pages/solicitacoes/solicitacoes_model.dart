import '/backend/api_requests/api_calls.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/alerta/alerta_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'solicitacoes_widget.dart' show SolicitacoesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SolicitacoesModel extends FlutterFlowModel<SolicitacoesWidget> {
  ///  Local state fields for this page.

  dynamic solicitacoes;

  List<String> lista = [];
  void addToLista(String item) => lista.add(item);
  void removeFromLista(String item) => lista.remove(item);
  void removeAtIndexFromLista(int index) => lista.removeAt(index);
  void insertAtIndexInLista(int index, String item) =>
      lista.insert(index, item);
  void updateListaAtIndex(int index, Function(String) updateFn) =>
      lista[index] = updateFn(lista[index]);

  int refreshTrigger = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (QuantidadePontosParaSincronar)] action in solicitacoes widget.
  List<QuantidadePontosParaSincronarRow>? qtsSinco;
  // Stores action output result for [Backend Call - SQLite (QuantidadePontosParaSincronar)] action in Row widget.
  List<QuantidadePontosParaSincronarRow>? quantidadeSincronizados;
  // Stores action output result for [Custom Action - sincronizarPonto] action in Row widget.
  bool? sincronizacao;
  // Stores action output result for [Backend Call - SQLite (QuantidadePontosParaSincronar)] action in Button widget.
  List<QuantidadePontosParaSincronarRow>? qtd;
  // Stores action output result for [Backend Call - SQLite (verificarSincronizao)] action in Button widget.
  List<VerificarSincronizaoRow>? sincronizado;
  // Stores action output result for [Backend Call - API (Update Solicitacoes)] action in Button widget.
  ApiCallResponse? apiResultz59;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
