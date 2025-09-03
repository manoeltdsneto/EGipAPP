import '/components/sobre_app_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'sobre_widget.dart' show SobreWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SobreModel extends FlutterFlowModel<SobreWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sobreApp component.
  late SobreAppModel sobreAppModel;

  @override
  void initState(BuildContext context) {
    sobreAppModel = createModel(context, () => SobreAppModel());
  }

  @override
  void dispose() {
    sobreAppModel.dispose();
  }
}
