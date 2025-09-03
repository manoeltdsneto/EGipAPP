import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'register_widget.dart' show RegisterWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  Local state fields for this page.

  String? lat;

  String? lng;

  int indice = 1;

  String type = 'novo';

  int? id;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getCurrentLocation] action in register widget.
  LatLng? location;
  // Stores action output result for [Validate Form] action in Row widget.
  bool? valid;
  // Stores action output result for [Custom Action - saveOrUpdatePontoForm] action in Row widget.
  bool? save;
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
  String? _txtIDpontoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'ID do ponto is required';
    }

    if (val.length < 7) {
      return 'Mínimo 7 número';
    }

    return null;
  }

  // State field(s) for txtEndereco widget.
  FocusNode? txtEnderecoFocusNode;
  TextEditingController? txtEnderecoTextController;
  String? Function(BuildContext, String?)? txtEnderecoTextControllerValidator;
  String? _txtEnderecoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Endereço is required';
    }

    if (val.length < 3) {
      return 'Mínimo 3 número caracteres';
    }

    return null;
  }

  // State field(s) for txtBairro widget.
  FocusNode? txtBairroFocusNode;
  TextEditingController? txtBairroTextController;
  String? Function(BuildContext, String?)? txtBairroTextControllerValidator;
  String? _txtBairroTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Bairro is required';
    }

    if (val.length < 3) {
      return 'Mínimo 3  caracteres';
    }

    return null;
  }

  // State field(s) for txtLocalizacao widget.
  FocusNode? txtLocalizacaoFocusNode;
  TextEditingController? txtLocalizacaoTextController;
  String? Function(BuildContext, String?)?
      txtLocalizacaoTextControllerValidator;
  String? _txtLocalizacaoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Localização is required';
    }

    if (val.length < 3) {
      return 'Mínimo 3  caracteres';
    }

    return null;
  }

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
  String? _txtTransformadorTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Transformador is required';
    }

    if (val.length < 3) {
      return 'Mínimo 3  caracteres';
    }

    return null;
  }

  // State field(s) for txtChave widget.
  FocusNode? txtChaveFocusNode;
  TextEditingController? txtChaveTextController;
  String? Function(BuildContext, String?)? txtChaveTextControllerValidator;
  String? _txtChaveTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Chave is required';
    }

    if (val.length < 3) {
      return 'Mínimo 3 caracteres';
    }

    return null;
  }

  // State field(s) for txtAcervoPoste widget.
  FocusNode? txtAcervoPosteFocusNode;
  TextEditingController? txtAcervoPosteTextController;
  String? Function(BuildContext, String?)?
      txtAcervoPosteTextControllerValidator;
  String? _txtAcervoPosteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Acervo poste is required';
    }

    if (val.length < 3) {
      return 'Mínimo 3  caracteres';
    }

    return null;
  }

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
  String? _txtIDpmplacaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'ID pm placa is required';
    }

    if (val.length < 3) {
      return 'Mínimo 3 caracteres';
    }

    return null;
  }

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
  // State field(s) for txtIDD1 widget.
  FocusNode? txtIDD1FocusNode;
  TextEditingController? txtIDD1TextController;
  String? Function(BuildContext, String?)? txtIDD1TextControllerValidator;
  String? _txtIDD1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'IDD is required';
    }

    if (val.length < 7) {
      return 'Mínimo 7 número ';
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
  // State field(s) for txtIDD2 widget.
  FocusNode? txtIDD2FocusNode;
  TextEditingController? txtIDD2TextController;
  String? Function(BuildContext, String?)? txtIDD2TextControllerValidator;
  // State field(s) for ddLuminaria2 widget.
  String? ddLuminaria2Value;
  FormFieldController<String>? ddLuminaria2ValueController;
  // State field(s) for ddLampada2 widget.
  String? ddLampada2Value;
  FormFieldController<String>? ddLampada2ValueController;
  // State field(s) for ddPotencia2 widget.
  String? ddPotencia2Value;
  FormFieldController<String>? ddPotencia2ValueController;
  // State field(s) for txtFabricante2 widget.
  FocusNode? txtFabricante2FocusNode;
  TextEditingController? txtFabricante2TextController;
  String? Function(BuildContext, String?)?
      txtFabricante2TextControllerValidator;
  // State field(s) for txtIDD3 widget.
  FocusNode? txtIDD3FocusNode;
  TextEditingController? txtIDD3TextController;
  String? Function(BuildContext, String?)? txtIDD3TextControllerValidator;
  // State field(s) for ddLuminaria3 widget.
  String? ddLuminaria3Value;
  FormFieldController<String>? ddLuminaria3ValueController;
  // State field(s) for ddLampada3 widget.
  String? ddLampada3Value;
  FormFieldController<String>? ddLampada3ValueController;
  // State field(s) for ddPotencia3 widget.
  String? ddPotencia3Value;
  FormFieldController<String>? ddPotencia3ValueController;
  // State field(s) for txtFabricante3 widget.
  FocusNode? txtFabricante3FocusNode;
  TextEditingController? txtFabricante3TextController;
  String? Function(BuildContext, String?)?
      txtFabricante3TextControllerValidator;
  // State field(s) for txtIDD4 widget.
  FocusNode? txtIDD4FocusNode;
  TextEditingController? txtIDD4TextController;
  String? Function(BuildContext, String?)? txtIDD4TextControllerValidator;
  // State field(s) for ddLuminaria4 widget.
  String? ddLuminaria4Value;
  FormFieldController<String>? ddLuminaria4ValueController;
  // State field(s) for ddLampada4 widget.
  String? ddLampada4Value;
  FormFieldController<String>? ddLampada4ValueController;
  // State field(s) for ddPotencia4 widget.
  String? ddPotencia4Value;
  FormFieldController<String>? ddPotencia4ValueController;
  // State field(s) for txtFabricante4 widget.
  FocusNode? txtFabricante4FocusNode;
  TextEditingController? txtFabricante4TextController;
  String? Function(BuildContext, String?)?
      txtFabricante4TextControllerValidator;
  // State field(s) for txtObservao widget.
  FocusNode? txtObservaoFocusNode;
  TextEditingController? txtObservaoTextController;
  String? Function(BuildContext, String?)? txtObservaoTextControllerValidator;
  // State field(s) for ddLaudotecnico widget.
  List<String>? ddLaudotecnicoValue;
  FormFieldController<List<String>>? ddLaudotecnicoValueController;
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
  // State field(s) for Switch widget.
  bool? switchValue;
  bool isDataUploading_fotosUploads = false;
  FFUploadedFile uploadedLocalFile_fotosUploads =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - convertBase64] action in Row widget.
  String? fotosTobase64;

  @override
  void initState(BuildContext context) {
    txtIDpontoTextControllerValidator = _txtIDpontoTextControllerValidator;
    txtEnderecoTextControllerValidator = _txtEnderecoTextControllerValidator;
    txtBairroTextControllerValidator = _txtBairroTextControllerValidator;
    txtLocalizacaoTextControllerValidator =
        _txtLocalizacaoTextControllerValidator;
    txtTransformadorTextControllerValidator =
        _txtTransformadorTextControllerValidator;
    txtChaveTextControllerValidator = _txtChaveTextControllerValidator;
    txtAcervoPosteTextControllerValidator =
        _txtAcervoPosteTextControllerValidator;
    txtIDpmplacaTextControllerValidator = _txtIDpmplacaTextControllerValidator;
    txtIDD1TextControllerValidator = _txtIDD1TextControllerValidator;
  }

  @override
  void dispose() {
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

    txtIDD1FocusNode?.dispose();
    txtIDD1TextController?.dispose();

    txtFabricante1FocusNode?.dispose();
    txtFabricante1TextController?.dispose();

    txtIDD2FocusNode?.dispose();
    txtIDD2TextController?.dispose();

    txtFabricante2FocusNode?.dispose();
    txtFabricante2TextController?.dispose();

    txtIDD3FocusNode?.dispose();
    txtIDD3TextController?.dispose();

    txtFabricante3FocusNode?.dispose();
    txtFabricante3TextController?.dispose();

    txtIDD4FocusNode?.dispose();
    txtIDD4TextController?.dispose();

    txtFabricante4FocusNode?.dispose();
    txtFabricante4TextController?.dispose();

    txtObservaoFocusNode?.dispose();
    txtObservaoTextController?.dispose();
  }
}
