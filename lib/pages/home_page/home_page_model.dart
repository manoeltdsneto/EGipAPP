import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? lat;

  String? long;

  LatLng? localizacaoAtual;

  int? zoom = 5;

  LatLng? tempoReal;

  String? url;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getCurrentLocation] action in HomePage widget.
  LatLng? locationB;
  // Stores action output result for [Custom Action - getCurrentLocation] action in Button widget.
  LatLng? response;
  // State field(s) for txtLat widget.
  FocusNode? txtLatFocusNode;
  TextEditingController? txtLatTextController;
  String? Function(BuildContext, String?)? txtLatTextControllerValidator;
  // State field(s) for txtLng widget.
  FocusNode? txtLngFocusNode;
  TextEditingController? txtLngTextController;
  String? Function(BuildContext, String?)? txtLngTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtLatFocusNode?.dispose();
    txtLatTextController?.dispose();

    txtLngFocusNode?.dispose();
    txtLngTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
