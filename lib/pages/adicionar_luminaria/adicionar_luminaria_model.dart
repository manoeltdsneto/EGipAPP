import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'adicionar_luminaria_widget.dart' show AdicionarLuminariaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdicionarLuminariaModel
    extends FlutterFlowModel<AdicionarLuminariaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - listarBairrosUnicosComContagem] action in AdicionarLuminaria widget.
  List<dynamic>? bairros;
  // State field(s) for txtIDD1 widget.
  FocusNode? txtIDD1FocusNode;
  TextEditingController? txtIDD1TextController;
  String? Function(BuildContext, String?)? txtIDD1TextControllerValidator;
  String? _txtIDD1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 7) {
      return 'Mínimo de 7 número';
    }

    return null;
  }

  // State field(s) for ddLuminaria1 widget.
  String? ddLuminaria1Value;
  FormFieldController<String>? ddLuminaria1ValueController;
  // State field(s) for ddLampada1 widget.
  String? ddLampada1Value;
  FormFieldController<String>? ddLampada1ValueController;
  // State field(s) for ddPotencia1 widget.
  String? ddPotencia1Value;
  FormFieldController<String>? ddPotencia1ValueController;
  // State field(s) for txtFabricante1 widget.
  FocusNode? txtFabricante1FocusNode;
  TextEditingController? txtFabricante1TextController;
  String? Function(BuildContext, String?)?
      txtFabricante1TextControllerValidator;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validacao;
  // Stores action output result for [Custom Action - adicionarLuminaria] action in Button widget.
  bool? retorno;

  @override
  void initState(BuildContext context) {
    txtIDD1TextControllerValidator = _txtIDD1TextControllerValidator;
  }

  @override
  void dispose() {
    txtIDD1FocusNode?.dispose();
    txtIDD1TextController?.dispose();

    txtFabricante1FocusNode?.dispose();
    txtFabricante1TextController?.dispose();
  }
}
