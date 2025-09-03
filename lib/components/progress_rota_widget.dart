import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'progress_rota_model.dart';
export 'progress_rota_model.dart';

/// Route Progress Indicator
class ProgressRotaWidget extends StatefulWidget {
  const ProgressRotaWidget({
    super.key,
    this.refreshTrigger,
  });

  final int? refreshTrigger;

  @override
  State<ProgressRotaWidget> createState() => _ProgressRotaWidgetState();
}

class _ProgressRotaWidgetState extends State<ProgressRotaWidget> {
  late ProgressRotaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressRotaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pontosConcluidos = await actions.contarPontosRecenseadosDasRotas();
      _model.totalPontos = await actions.contarPontosUnicosDasRotas();
      _model.concluidos = valueOrDefault<int>(
        _model.pontosConcluidos,
        0,
      );
      safeSetState(() {});
      _model.total = valueOrDefault<int>(
        _model.totalPontos,
        0,
      );
      safeSetState(() {});
      _model.percent = valueOrDefault<double>(
        (int concluidos, int total) {
          return total.toDouble() > 0
              ? (concluidos.toDouble() / total.toDouble())
              : 0.0;
        }(_model.concluidos, _model.total),
        0.0,
      );
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Progresso da Rota',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                  ),
                  Text(
                    '${(_model.percent * 100).toStringAsFixed(0)}%',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                  ),
                ],
              ),
              Text(
                valueOrDefault<String>(
                  '${valueOrDefault<String>(
                    _model.concluidos.toString(),
                    '0',
                  )} de ${valueOrDefault<String>(
                    _model.total.toString(),
                    '0',
                  )} pontos concluídos',
                  '0',
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodySmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodySmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodySmall.fontStyle,
                    ),
              ),
              Container(
                width: double.infinity,
                height: 10.0,
                decoration: BoxDecoration(
                  color: Color(0x08E0E3E7),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: LinearPercentIndicator(
                  percent: _model.percent,
                  lineHeight: 12.0,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: FlutterFlowTheme.of(context).primaryText,
                  backgroundColor: FlutterFlowTheme.of(context).alternate,
                  barRadius: Radius.circular(25.0),
                  padding: EdgeInsets.zero,
                ),
              ),
            ].divide(SizedBox(height: 8.0)),
          ),
        ),
      ),
    );
  }
}
