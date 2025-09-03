import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'principal_widget.dart' show PrincipalWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PrincipalModel extends FlutterFlowModel<PrincipalWidget> {
  ///  Local state fields for this page.

  int contador = -1;

  bool isLoading = false;

  String data = 'as';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - contarPontosUnicosDasRotas] action in Principal widget.
  int? total;
  // Stores action output result for [Custom Action - contarPontosRecenseadosDasRotas] action in Principal widget.
  int? concluido;
  // Stores action output result for [Backend Call - SQLite (selectByIDUsuarios)] action in Principal widget.
  List<SelectByIDUsuariosRow>? bdUsuario;
  // Stores action output result for [Custom Action - sincronizarTudo] action in Button widget.
  bool? servidor;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
