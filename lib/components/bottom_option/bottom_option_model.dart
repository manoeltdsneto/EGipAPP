import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'bottom_option_widget.dart' show BottomOptionWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomOptionModel extends FlutterFlowModel<BottomOptionWidget> {
  ///  Local state fields for this component.

  List<dynamic> lista = [];
  void addToLista(dynamic item) => lista.add(item);
  void removeFromLista(dynamic item) => lista.remove(item);
  void removeAtIndexFromLista(int index) => lista.removeAt(index);
  void insertAtIndexInLista(int index, dynamic item) =>
      lista.insert(index, item);
  void updateListaAtIndex(int index, Function(dynamic) updateFn) =>
      lista[index] = updateFn(lista[index]);

  dynamic getJsonCadastroL;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - readCadastroAsCSV] action in Container widget.
  String? bottomListaASCSV;
  // Stores action output result for [Custom Action - saveCSVFile] action in Container widget.
  String? saveCSVFile;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
