import '/components/user_profile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_perfil_model.dart';
export 'user_perfil_model.dart';

class UserPerfilWidget extends StatefulWidget {
  const UserPerfilWidget({super.key});

  static String routeName = 'userPerfil';
  static String routePath = '/userPerfil';

  @override
  State<UserPerfilWidget> createState() => _UserPerfilWidgetState();
}

class _UserPerfilWidgetState extends State<UserPerfilWidget> {
  late UserPerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserPerfilModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.verificarConexaoInternet(
        context,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.userProfileModel,
                  updateCallback: () => safeSetState(() {}),
                  child: UserProfileWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
