import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'filter_widget.dart' show FilterWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterModel extends FlutterFlowModel<FilterWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtIdd widget.
  FocusNode? txtIddFocusNode;
  TextEditingController? txtIddTextController;
  String? Function(BuildContext, String?)? txtIddTextControllerValidator;
  // State field(s) for txtIdPonto widget.
  FocusNode? txtIdPontoFocusNode;
  TextEditingController? txtIdPontoTextController;
  String? Function(BuildContext, String?)? txtIdPontoTextControllerValidator;
  // State field(s) for txtMunicipio widget.
  FocusNode? txtMunicipioFocusNode;
  TextEditingController? txtMunicipioTextController;
  String? Function(BuildContext, String?)? txtMunicipioTextControllerValidator;
  // State field(s) for txtEndereco widget.
  FocusNode? txtEnderecoFocusNode;
  TextEditingController? txtEnderecoTextController;
  String? Function(BuildContext, String?)? txtEnderecoTextControllerValidator;
  // State field(s) for txtBairro widget.
  FocusNode? txtBairroFocusNode;
  TextEditingController? txtBairroTextController;
  String? Function(BuildContext, String?)? txtBairroTextControllerValidator;
  // State field(s) for txtLocalizao widget.
  FocusNode? txtLocalizaoFocusNode;
  TextEditingController? txtLocalizaoTextController;
  String? Function(BuildContext, String?)? txtLocalizaoTextControllerValidator;
  // Stores action output result for [Custom Action - buscarRegistrosPaginadosComFiltro] action in Button widget.
  List<dynamic>? registrosCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtIddFocusNode?.dispose();
    txtIddTextController?.dispose();

    txtIdPontoFocusNode?.dispose();
    txtIdPontoTextController?.dispose();

    txtMunicipioFocusNode?.dispose();
    txtMunicipioTextController?.dispose();

    txtEnderecoFocusNode?.dispose();
    txtEnderecoTextController?.dispose();

    txtBairroFocusNode?.dispose();
    txtBairroTextController?.dispose();

    txtLocalizaoFocusNode?.dispose();
    txtLocalizaoTextController?.dispose();
  }
}
