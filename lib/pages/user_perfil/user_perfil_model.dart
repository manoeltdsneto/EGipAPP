import '/components/user_profile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'user_perfil_widget.dart' show UserPerfilWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserPerfilModel extends FlutterFlowModel<UserPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for userProfile component.
  late UserProfileModel userProfileModel;

  @override
  void initState(BuildContext context) {
    userProfileModel = createModel(context, () => UserProfileModel());
  }

  @override
  void dispose() {
    userProfileModel.dispose();
  }
}
