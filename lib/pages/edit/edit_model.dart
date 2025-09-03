import '/backend/sqlite/sqlite_manager.dart';
import '/components/alerta/alerta_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_widget.dart' show EditWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditModel extends FlutterFlowModel<EditWidget> {
  ///  Local state fields for this page.

  String? lat;

  String? lng;

  int indice = 1;

  String type = 'novo';

  int? id;

  List<dynamic> luminariasFormulario = [];
  void addToLuminariasFormulario(dynamic item) =>
      luminariasFormulario.add(item);
  void removeFromLuminariasFormulario(dynamic item) =>
      luminariasFormulario.remove(item);
  void removeAtIndexFromLuminariasFormulario(int index) =>
      luminariasFormulario.removeAt(index);
  void insertAtIndexInLuminariasFormulario(int index, dynamic item) =>
      luminariasFormulario.insert(index, item);
  void updateLuminariasFormularioAtIndex(
          int index, Function(dynamic) updateFn) =>
      luminariasFormulario[index] = updateFn(luminariasFormulario[index]);

  String? latitude;

  String? longitude;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getCurrentLocation] action in edit widget.
  LatLng? localizacao;
  // Stores action output result for [Backend Call - SQLite (SelecionarPontosByidPonto)] action in edit widget.
  List<SelecionarPontosByidPontoRow>? response;
  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - editarPontos] action in Container widget.
  bool? sucesso;
  // Stores action output result for [Custom Action - getCurrentLocation] action in Row widget.
  LatLng? locationC;
  // State field(s) for txtMunicipio widget.
  FocusNode? txtMunicipioFocusNode;
  TextEditingController? txtMunicipioTextController;
  String? Function(BuildContext, String?)? txtMunicipioTextControllerValidator;
  // State field(s) for txtCodmunicipio widget.
  FocusNode? txtCodmunicipioFocusNode;
  TextEditingController? txtCodmunicipioTextController;
  String? Function(BuildContext, String?)?
      txtCodmunicipioTextControllerValidator;
  // State field(s) for txtIDponto widget.
  FocusNode? txtIDpontoFocusNode;
  TextEditingController? txtIDpontoTextController;
  String? Function(BuildContext, String?)? txtIDpontoTextControllerValidator;
  // State field(s) for txtEndereco widget.
  FocusNode? txtEnderecoFocusNode;
  TextEditingController? txtEnderecoTextController;
  String? Function(BuildContext, String?)? txtEnderecoTextControllerValidator;
  // State field(s) for txtBairro widget.
  FocusNode? txtBairroFocusNode;
  TextEditingController? txtBairroTextController;
  String? Function(BuildContext, String?)? txtBairroTextControllerValidator;
  // State field(s) for txtLocalizacao widget.
  FocusNode? txtLocalizacaoFocusNode;
  TextEditingController? txtLocalizacaoTextController;
  String? Function(BuildContext, String?)?
      txtLocalizacaoTextControllerValidator;
  // State field(s) for txtZona widget.
  FocusNode? txtZonaFocusNode;
  TextEditingController? txtZonaTextController;
  String? Function(BuildContext, String?)? txtZonaTextControllerValidator;
  // State field(s) for ddPosicao widget.
  String? ddPosicaoValue;
  FormFieldController<String>? ddPosicaoValueController;
  // State field(s) for txtTransformador widget.
  FocusNode? txtTransformadorFocusNode;
  TextEditingController? txtTransformadorTextController;
  String? Function(BuildContext, String?)?
      txtTransformadorTextControllerValidator;
  // State field(s) for txtChave widget.
  FocusNode? txtChaveFocusNode;
  TextEditingController? txtChaveTextController;
  String? Function(BuildContext, String?)? txtChaveTextControllerValidator;
  // State field(s) for txtAcervoPoste widget.
  FocusNode? txtAcervoPosteFocusNode;
  TextEditingController? txtAcervoPosteTextController;
  String? Function(BuildContext, String?)?
      txtAcervoPosteTextControllerValidator;
  // State field(s) for ddMedicao widget.
  String? ddMedicaoValue;
  FormFieldController<String>? ddMedicaoValueController;
  // State field(s) for txtMedidorNC widget.
  FocusNode? txtMedidorNCFocusNode;
  TextEditingController? txtMedidorNCTextController;
  String? Function(BuildContext, String?)? txtMedidorNCTextControllerValidator;
  // State field(s) for txtSequencia widget.
  FocusNode? txtSequenciaFocusNode;
  TextEditingController? txtSequenciaTextController;
  String? Function(BuildContext, String?)? txtSequenciaTextControllerValidator;
  // State field(s) for txtMedidorreferencia widget.
  FocusNode? txtMedidorreferenciaFocusNode;
  TextEditingController? txtMedidorreferenciaTextController;
  String? Function(BuildContext, String?)?
      txtMedidorreferenciaTextControllerValidator;
  // State field(s) for txtIDpmplaca widget.
  FocusNode? txtIDpmplacaFocusNode;
  TextEditingController? txtIDpmplacaTextController;
  String? Function(BuildContext, String?)? txtIDpmplacaTextControllerValidator;
  // State field(s) for ddFotoeletrico widget.
  String? ddFotoeletricoValue;
  FormFieldController<String>? ddFotoeletricoValueController;
  // State field(s) for txtCircuitoexclusivo widget.
  FocusNode? txtCircuitoexclusivoFocusNode;
  TextEditingController? txtCircuitoexclusivoTextController;
  String? Function(BuildContext, String?)?
      txtCircuitoexclusivoTextControllerValidator;
  // State field(s) for ddFaseligacao widget.
  String? ddFaseligacaoValue;
  FormFieldController<String>? ddFaseligacaoValueController;
  // State field(s) for ddTiporede widget.
  String? ddTiporedeValue;
  FormFieldController<String>? ddTiporedeValueController;
  // State field(s) for ddTipoPoste widget.
  String? ddTipoPosteValue;
  FormFieldController<String>? ddTipoPosteValueController;
  // State field(s) for ddAlturaPoste widget.
  String? ddAlturaPosteValue;
  FormFieldController<String>? ddAlturaPosteValueController;
  // State field(s) for ddTamanhoBraco widget.
  String? ddTamanhoBracoValue;
  FormFieldController<String>? ddTamanhoBracoValueController;
  // State field(s) for SwitchPontoNovo widget.
  bool? switchPontoNovoValue;
  // State field(s) for txtObservao widget.
  FocusNode? txtObservaoFocusNode;
  TextEditingController? txtObservaoTextController;
  String? Function(BuildContext, String?)? txtObservaoTextControllerValidator;
  // State field(s) for ddLaudotecnico widget.
  List<String>? ddLaudotecnicoValue;
  FormFieldController<List<String>>? ddLaudotecnicoValueController;
  // State field(s) for ddManutencoes widget.
  List<String>? ddManutencoesValue;
  FormFieldController<List<String>>? ddManutencoesValueController;
  // State field(s) for Switch widget.
  bool? switchValue;
  bool isDataUploading_fotosUpload = false;
  FFUploadedFile uploadedLocalFile_fotosUpload =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - convertBase64] action in Row widget.
  String? fotosTobase64;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    txtMunicipioFocusNode?.dispose();
    txtMunicipioTextController?.dispose();

    txtCodmunicipioFocusNode?.dispose();
    txtCodmunicipioTextController?.dispose();

    txtIDpontoFocusNode?.dispose();
    txtIDpontoTextController?.dispose();

    txtEnderecoFocusNode?.dispose();
    txtEnderecoTextController?.dispose();

    txtBairroFocusNode?.dispose();
    txtBairroTextController?.dispose();

    txtLocalizacaoFocusNode?.dispose();
    txtLocalizacaoTextController?.dispose();

    txtZonaFocusNode?.dispose();
    txtZonaTextController?.dispose();

    txtTransformadorFocusNode?.dispose();
    txtTransformadorTextController?.dispose();

    txtChaveFocusNode?.dispose();
    txtChaveTextController?.dispose();

    txtAcervoPosteFocusNode?.dispose();
    txtAcervoPosteTextController?.dispose();

    txtMedidorNCFocusNode?.dispose();
    txtMedidorNCTextController?.dispose();

    txtSequenciaFocusNode?.dispose();
    txtSequenciaTextController?.dispose();

    txtMedidorreferenciaFocusNode?.dispose();
    txtMedidorreferenciaTextController?.dispose();

    txtIDpmplacaFocusNode?.dispose();
    txtIDpmplacaTextController?.dispose();

    txtCircuitoexclusivoFocusNode?.dispose();
    txtCircuitoexclusivoTextController?.dispose();

    txtObservaoFocusNode?.dispose();
    txtObservaoTextController?.dispose();
  }
}
