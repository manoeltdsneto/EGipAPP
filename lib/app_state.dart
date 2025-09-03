import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cadastro = prefs
              .getStringList('ff_cadastro')
              ?.map((x) {
                try {
                  return CadastroStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cadastro;
    });
    _safeInit(() {
      _codigoIBGE = prefs.getInt('ff_codigoIBGE') ?? _codigoIBGE;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userLogado')) {
        try {
          final serializedData = prefs.getString('ff_userLogado') ?? '{}';
          _userLogado =
              UserLogadoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _temInternet = prefs.getBool('ff_temInternet') ?? _temInternet;
    });
    _safeInit(() {
      _darkMode = prefs.getBool('ff_darkMode') ?? _darkMode;
    });
    _safeInit(() {
      _selectMunicipio =
          prefs.getString('ff_selectMunicipio') ?? _selectMunicipio;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_municipioSelecionado')) {
        try {
          final serializedData =
              prefs.getString('ff_municipioSelecionado') ?? '{}';
          _municipioSelecionado = CampoMunicipioStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _listaPoste = prefs
              .getStringList('ff_listaPoste')
              ?.map((x) {
                try {
                  return DtPontoPosteStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _listaPoste;
    });
    _safeInit(() {
      _pontosApi = prefs
              .getStringList('ff_pontosApi')
              ?.map((x) {
                try {
                  return StPontoCadastroStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _pontosApi;
    });
    _safeInit(() {
      _ultimaSincronizacao =
          prefs.getString('ff_ultimaSincronizacao') ?? _ultimaSincronizacao;
    });
    _safeInit(() {
      _logs = prefs.getStringList('ff_logs') ?? _logs;
    });
    _safeInit(() {
      _municipioEmAtucao =
          prefs.getInt('ff_municipioEmAtucao') ?? _municipioEmAtucao;
    });
    _safeInit(() {
      _recarregarMapa = prefs.getBool('ff_recarregarMapa') ?? _recarregarMapa;
    });
    _safeInit(() {
      _municipioID = prefs.getInt('ff_municipioID') ?? _municipioID;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_settings')) {
        try {
          final serializedData = prefs.getString('ff_settings') ?? '{}';
          _settings =
              SettingsStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _sandbox = prefs.getBool('ff_sandbox') ?? _sandbox;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<CadastroStruct> _cadastro = [
    CadastroStruct.fromSerializableMap(jsonDecode(
        '{\"IDD\":\"0\",\"id_ponto\":\"0\",\"sequencia\":\"0\",\"codigo_cliente\":\"0\",\"cidade\":\"Hello World\",\"transformador\":\"Hello World\",\"chave\":\"Hello World\",\"posicao\":\"Hello World\",\"endereco\":\"Hello World\",\"bairro\":\"Hello World\",\"acervo_poste\":\"Hello World\",\"medicao\":\"Hello World\",\"medidor_nc\":\"0\",\"localizacao\":\"Hello World\",\"tipo_lampada\":\"Hello World\",\"potencia\":\"0\",\"tipo_luminaria\":\"Hello World\",\"tipo_rede\":\"Hello World\",\"fase_ligacao\":\"Hello World\",\"ID_PM_placa\":\"Hello World\",\"medidor_referencia\":\"Hello World\",\"latitude\":\"Hello World\",\"longitude\":\"Hello World\",\"zona\":\"0\",\"observacao\":\"Hello World\",\"circuito_exclusivo\":\"Hello World\",\"rele_fotoeletrico\":\"Hello World\"}'))
  ];
  List<CadastroStruct> get cadastro => _cadastro;
  set cadastro(List<CadastroStruct> value) {
    _cadastro = value;
    prefs.setStringList(
        'ff_cadastro', value.map((x) => x.serialize()).toList());
  }

  void addToCadastro(CadastroStruct value) {
    cadastro.add(value);
    prefs.setStringList(
        'ff_cadastro', _cadastro.map((x) => x.serialize()).toList());
  }

  void removeFromCadastro(CadastroStruct value) {
    cadastro.remove(value);
    prefs.setStringList(
        'ff_cadastro', _cadastro.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCadastro(int index) {
    cadastro.removeAt(index);
    prefs.setStringList(
        'ff_cadastro', _cadastro.map((x) => x.serialize()).toList());
  }

  void updateCadastroAtIndex(
    int index,
    CadastroStruct Function(CadastroStruct) updateFn,
  ) {
    cadastro[index] = updateFn(_cadastro[index]);
    prefs.setStringList(
        'ff_cadastro', _cadastro.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCadastro(int index, CadastroStruct value) {
    cadastro.insert(index, value);
    prefs.setStringList(
        'ff_cadastro', _cadastro.map((x) => x.serialize()).toList());
  }

  int _codigoIBGE = 0;
  int get codigoIBGE => _codigoIBGE;
  set codigoIBGE(int value) {
    _codigoIBGE = value;
    prefs.setInt('ff_codigoIBGE', value);
  }

  UserLogadoStruct _userLogado = UserLogadoStruct();
  UserLogadoStruct get userLogado => _userLogado;
  set userLogado(UserLogadoStruct value) {
    _userLogado = value;
    prefs.setString('ff_userLogado', value.serialize());
  }

  void updateUserLogadoStruct(Function(UserLogadoStruct) updateFn) {
    updateFn(_userLogado);
    prefs.setString('ff_userLogado', _userLogado.serialize());
  }

  bool _temInternet = false;
  bool get temInternet => _temInternet;
  set temInternet(bool value) {
    _temInternet = value;
    prefs.setBool('ff_temInternet', value);
  }

  String _senha = '';
  String get senha => _senha;
  set senha(String value) {
    _senha = value;
  }

  List<UsuariosStruct> _usuarios = [
    UsuariosStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"0\",\"nome\":\"Hello World\",\"email\":\"Hello World\",\"permissoes\":\"Hello World\",\"senha\":\"Hello World\"}'))
  ];
  List<UsuariosStruct> get usuarios => _usuarios;
  set usuarios(List<UsuariosStruct> value) {
    _usuarios = value;
  }

  void addToUsuarios(UsuariosStruct value) {
    usuarios.add(value);
  }

  void removeFromUsuarios(UsuariosStruct value) {
    usuarios.remove(value);
  }

  void removeAtIndexFromUsuarios(int index) {
    usuarios.removeAt(index);
  }

  void updateUsuariosAtIndex(
    int index,
    UsuariosStruct Function(UsuariosStruct) updateFn,
  ) {
    usuarios[index] = updateFn(_usuarios[index]);
  }

  void insertAtIndexInUsuarios(int index, UsuariosStruct value) {
    usuarios.insert(index, value);
  }

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool value) {
    _darkMode = value;
    prefs.setBool('ff_darkMode', value);
  }

  List<DtMunicipioStruct> _municipioList = [];
  List<DtMunicipioStruct> get municipioList => _municipioList;
  set municipioList(List<DtMunicipioStruct> value) {
    _municipioList = value;
  }

  void addToMunicipioList(DtMunicipioStruct value) {
    municipioList.add(value);
  }

  void removeFromMunicipioList(DtMunicipioStruct value) {
    municipioList.remove(value);
  }

  void removeAtIndexFromMunicipioList(int index) {
    municipioList.removeAt(index);
  }

  void updateMunicipioListAtIndex(
    int index,
    DtMunicipioStruct Function(DtMunicipioStruct) updateFn,
  ) {
    municipioList[index] = updateFn(_municipioList[index]);
  }

  void insertAtIndexInMunicipioList(int index, DtMunicipioStruct value) {
    municipioList.insert(index, value);
  }

  String _selectMunicipio = '';
  String get selectMunicipio => _selectMunicipio;
  set selectMunicipio(String value) {
    _selectMunicipio = value;
    prefs.setString('ff_selectMunicipio', value);
  }

  List<CadastroStruct> _pontoList = [
    CadastroStruct.fromSerializableMap(jsonDecode(
        '{\"Id\":\"0\",\"IDD\":\"Hello World\",\"id_ponto\":\"Hello World\",\"codigo_ibge\":\"0\",\"sequencia\":\"Hello World\",\"cod_cliente\":\"Hello World\",\"cod_cidade\":\"Hello World\",\"cidade\":\"Hello World\",\"uf\":\"Hello World\",\"transformador\":\"Hello World\",\"chave\":\"Hello World\",\"posicao\":\"Hello World\",\"endereco\":\"Hello World\",\"bairro\":\"Hello World\",\"acervo_poste\":\"Hello World\",\"medicao\":\"Hello World\",\"medidor_nc\":\"0\",\"localizacao\":\"Hello World\",\"tipo_lampada\":\"Hello World\",\"potencia\":\"0\",\"tipo_luminaria\":\"Hello World\",\"tipo_rede\":\"Hello World\",\"fase_ligacao\":\"Hello World\",\"ID_PM_Placa\":\"Hello World\",\"medidor_referencia\":\"Hello World\",\"latitude\":\"Hello World\",\"longitude\":\"Hello World\",\"zona\":\"0\",\"observacao\":\"Hello World\",\"circuito_exclusivo\":\"Hello World\",\"rele_fotoeletrico\":\"Hello World\",\"recenseado\":\"Hello World\",\"imagens\":\"Hello World\"}'))
  ];
  List<CadastroStruct> get pontoList => _pontoList;
  set pontoList(List<CadastroStruct> value) {
    _pontoList = value;
  }

  void addToPontoList(CadastroStruct value) {
    pontoList.add(value);
  }

  void removeFromPontoList(CadastroStruct value) {
    pontoList.remove(value);
  }

  void removeAtIndexFromPontoList(int index) {
    pontoList.removeAt(index);
  }

  void updatePontoListAtIndex(
    int index,
    CadastroStruct Function(CadastroStruct) updateFn,
  ) {
    pontoList[index] = updateFn(_pontoList[index]);
  }

  void insertAtIndexInPontoList(int index, CadastroStruct value) {
    pontoList.insert(index, value);
  }

  StPontoCadastroStruct _ponto = StPontoCadastroStruct();
  StPontoCadastroStruct get ponto => _ponto;
  set ponto(StPontoCadastroStruct value) {
    _ponto = value;
  }

  void updatePontoStruct(Function(StPontoCadastroStruct) updateFn) {
    updateFn(_ponto);
  }

  dynamic _convertListToJson;
  dynamic get convertListToJson => _convertListToJson;
  set convertListToJson(dynamic value) {
    _convertListToJson = value;
  }

  CampoMunicipioStruct _municipioSelecionado = CampoMunicipioStruct();
  CampoMunicipioStruct get municipioSelecionado => _municipioSelecionado;
  set municipioSelecionado(CampoMunicipioStruct value) {
    _municipioSelecionado = value;
    prefs.setString('ff_municipioSelecionado', value.serialize());
  }

  void updateMunicipioSelecionadoStruct(
      Function(CampoMunicipioStruct) updateFn) {
    updateFn(_municipioSelecionado);
    prefs.setString(
        'ff_municipioSelecionado', _municipioSelecionado.serialize());
  }

  List<String> _listaImagensBase64 = [];
  List<String> get listaImagensBase64 => _listaImagensBase64;
  set listaImagensBase64(List<String> value) {
    _listaImagensBase64 = value;
  }

  void addToListaImagensBase64(String value) {
    listaImagensBase64.add(value);
  }

  void removeFromListaImagensBase64(String value) {
    listaImagensBase64.remove(value);
  }

  void removeAtIndexFromListaImagensBase64(int index) {
    listaImagensBase64.removeAt(index);
  }

  void updateListaImagensBase64AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listaImagensBase64[index] = updateFn(_listaImagensBase64[index]);
  }

  void insertAtIndexInListaImagensBase64(int index, String value) {
    listaImagensBase64.insert(index, value);
  }

  List<String> _urlImages = [];
  List<String> get urlImages => _urlImages;
  set urlImages(List<String> value) {
    _urlImages = value;
  }

  void addToUrlImages(String value) {
    urlImages.add(value);
  }

  void removeFromUrlImages(String value) {
    urlImages.remove(value);
  }

  void removeAtIndexFromUrlImages(int index) {
    urlImages.removeAt(index);
  }

  void updateUrlImagesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    urlImages[index] = updateFn(_urlImages[index]);
  }

  void insertAtIndexInUrlImages(int index, String value) {
    urlImages.insert(index, value);
  }

  List<DtPontoPosteStruct> _listaPoste = [
    DtPontoPosteStruct.fromSerializableMap(jsonDecode(
        '{\"nome\":\"Poste 1\",\"descricao\":\"Perto da praça\",\"latitude\":\"-6.347402\",\"longitude\":\"-39.3112841\",\"location\":\"-6.350661300000001,-39.307806\"}')),
    DtPontoPosteStruct.fromSerializableMap(jsonDecode(
        '{\"nome\":\"Poste 001\",\"descricao\":\"Em frente à escola\",\"latitude\":\"-6.347402\",\"longitude\":\"-39.3112841\",\"location\":\"-6.3512849,-39.3131307\"}'))
  ];
  List<DtPontoPosteStruct> get listaPoste => _listaPoste;
  set listaPoste(List<DtPontoPosteStruct> value) {
    _listaPoste = value;
    prefs.setStringList(
        'ff_listaPoste', value.map((x) => x.serialize()).toList());
  }

  void addToListaPoste(DtPontoPosteStruct value) {
    listaPoste.add(value);
    prefs.setStringList(
        'ff_listaPoste', _listaPoste.map((x) => x.serialize()).toList());
  }

  void removeFromListaPoste(DtPontoPosteStruct value) {
    listaPoste.remove(value);
    prefs.setStringList(
        'ff_listaPoste', _listaPoste.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListaPoste(int index) {
    listaPoste.removeAt(index);
    prefs.setStringList(
        'ff_listaPoste', _listaPoste.map((x) => x.serialize()).toList());
  }

  void updateListaPosteAtIndex(
    int index,
    DtPontoPosteStruct Function(DtPontoPosteStruct) updateFn,
  ) {
    listaPoste[index] = updateFn(_listaPoste[index]);
    prefs.setStringList(
        'ff_listaPoste', _listaPoste.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListaPoste(int index, DtPontoPosteStruct value) {
    listaPoste.insert(index, value);
    prefs.setStringList(
        'ff_listaPoste', _listaPoste.map((x) => x.serialize()).toList());
  }

  List<StPontoCadastroStruct> _pontosApi = [];
  List<StPontoCadastroStruct> get pontosApi => _pontosApi;
  set pontosApi(List<StPontoCadastroStruct> value) {
    _pontosApi = value;
    prefs.setStringList(
        'ff_pontosApi', value.map((x) => x.serialize()).toList());
  }

  void addToPontosApi(StPontoCadastroStruct value) {
    pontosApi.add(value);
    prefs.setStringList(
        'ff_pontosApi', _pontosApi.map((x) => x.serialize()).toList());
  }

  void removeFromPontosApi(StPontoCadastroStruct value) {
    pontosApi.remove(value);
    prefs.setStringList(
        'ff_pontosApi', _pontosApi.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPontosApi(int index) {
    pontosApi.removeAt(index);
    prefs.setStringList(
        'ff_pontosApi', _pontosApi.map((x) => x.serialize()).toList());
  }

  void updatePontosApiAtIndex(
    int index,
    StPontoCadastroStruct Function(StPontoCadastroStruct) updateFn,
  ) {
    pontosApi[index] = updateFn(_pontosApi[index]);
    prefs.setStringList(
        'ff_pontosApi', _pontosApi.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPontosApi(int index, StPontoCadastroStruct value) {
    pontosApi.insert(index, value);
    prefs.setStringList(
        'ff_pontosApi', _pontosApi.map((x) => x.serialize()).toList());
  }

  int _limiteOffset = 0;
  int get limiteOffset => _limiteOffset;
  set limiteOffset(int value) {
    _limiteOffset = value;
  }

  int _tamanhoPagina = 50;
  int get tamanhoPagina => _tamanhoPagina;
  set tamanhoPagina(int value) {
    _tamanhoPagina = value;
  }

  List<String> _listaPontosAtualizada = [];
  List<String> get listaPontosAtualizada => _listaPontosAtualizada;
  set listaPontosAtualizada(List<String> value) {
    _listaPontosAtualizada = value;
  }

  void addToListaPontosAtualizada(String value) {
    listaPontosAtualizada.add(value);
  }

  void removeFromListaPontosAtualizada(String value) {
    listaPontosAtualizada.remove(value);
  }

  void removeAtIndexFromListaPontosAtualizada(int index) {
    listaPontosAtualizada.removeAt(index);
  }

  void updateListaPontosAtualizadaAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listaPontosAtualizada[index] = updateFn(_listaPontosAtualizada[index]);
  }

  void insertAtIndexInListaPontosAtualizada(int index, String value) {
    listaPontosAtualizada.insert(index, value);
  }

  dynamic _listToJson;
  dynamic get listToJson => _listToJson;
  set listToJson(dynamic value) {
    _listToJson = value;
  }

  String _ultimaSincronizacao = '';
  String get ultimaSincronizacao => _ultimaSincronizacao;
  set ultimaSincronizacao(String value) {
    _ultimaSincronizacao = value;
    prefs.setString('ff_ultimaSincronizacao', value);
  }

  FilterCampoStruct _filter = FilterCampoStruct();
  FilterCampoStruct get filter => _filter;
  set filter(FilterCampoStruct value) {
    _filter = value;
  }

  void updateFilterStruct(Function(FilterCampoStruct) updateFn) {
    updateFn(_filter);
  }

  List<dynamic> _pontoToJson = [];
  List<dynamic> get pontoToJson => _pontoToJson;
  set pontoToJson(List<dynamic> value) {
    _pontoToJson = value;
  }

  void addToPontoToJson(dynamic value) {
    pontoToJson.add(value);
  }

  void removeFromPontoToJson(dynamic value) {
    pontoToJson.remove(value);
  }

  void removeAtIndexFromPontoToJson(int index) {
    pontoToJson.removeAt(index);
  }

  void updatePontoToJsonAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    pontoToJson[index] = updateFn(_pontoToJson[index]);
  }

  void insertAtIndexInPontoToJson(int index, dynamic value) {
    pontoToJson.insert(index, value);
  }

  List<String> _logs = [];
  List<String> get logs => _logs;
  set logs(List<String> value) {
    _logs = value;
    prefs.setStringList('ff_logs', value);
  }

  void addToLogs(String value) {
    logs.add(value);
    prefs.setStringList('ff_logs', _logs);
  }

  void removeFromLogs(String value) {
    logs.remove(value);
    prefs.setStringList('ff_logs', _logs);
  }

  void removeAtIndexFromLogs(int index) {
    logs.removeAt(index);
    prefs.setStringList('ff_logs', _logs);
  }

  void updateLogsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    logs[index] = updateFn(_logs[index]);
    prefs.setStringList('ff_logs', _logs);
  }

  void insertAtIndexInLogs(int index, String value) {
    logs.insert(index, value);
    prefs.setStringList('ff_logs', _logs);
  }

  int _municipioEmAtucao = 0;
  int get municipioEmAtucao => _municipioEmAtucao;
  set municipioEmAtucao(int value) {
    _municipioEmAtucao = value;
    prefs.setInt('ff_municipioEmAtucao', value);
  }

  bool _recarregarMapa = false;
  bool get recarregarMapa => _recarregarMapa;
  set recarregarMapa(bool value) {
    _recarregarMapa = value;
    prefs.setBool('ff_recarregarMapa', value);
  }

  RotaLatLogStruct _rotaLatLog = RotaLatLogStruct();
  RotaLatLogStruct get rotaLatLog => _rotaLatLog;
  set rotaLatLog(RotaLatLogStruct value) {
    _rotaLatLog = value;
  }

  void updateRotaLatLogStruct(Function(RotaLatLogStruct) updateFn) {
    updateFn(_rotaLatLog);
  }

  List<dynamic> _pontosBairroJson = [];
  List<dynamic> get pontosBairroJson => _pontosBairroJson;
  set pontosBairroJson(List<dynamic> value) {
    _pontosBairroJson = value;
  }

  void addToPontosBairroJson(dynamic value) {
    pontosBairroJson.add(value);
  }

  void removeFromPontosBairroJson(dynamic value) {
    pontosBairroJson.remove(value);
  }

  void removeAtIndexFromPontosBairroJson(int index) {
    pontosBairroJson.removeAt(index);
  }

  void updatePontosBairroJsonAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    pontosBairroJson[index] = updateFn(_pontosBairroJson[index]);
  }

  void insertAtIndexInPontosBairroJson(int index, dynamic value) {
    pontosBairroJson.insert(index, value);
  }

  dynamic _pontoView;
  dynamic get pontoView => _pontoView;
  set pontoView(dynamic value) {
    _pontoView = value;
  }

  RotaDestinoStruct _rotaDestino = RotaDestinoStruct();
  RotaDestinoStruct get rotaDestino => _rotaDestino;
  set rotaDestino(RotaDestinoStruct value) {
    _rotaDestino = value;
  }

  void updateRotaDestinoStruct(Function(RotaDestinoStruct) updateFn) {
    updateFn(_rotaDestino);
  }

  List<String> _fabricante = [];
  List<String> get fabricante => _fabricante;
  set fabricante(List<String> value) {
    _fabricante = value;
  }

  void addToFabricante(String value) {
    fabricante.add(value);
  }

  void removeFromFabricante(String value) {
    fabricante.remove(value);
  }

  void removeAtIndexFromFabricante(int index) {
    fabricante.removeAt(index);
  }

  void updateFabricanteAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    fabricante[index] = updateFn(_fabricante[index]);
  }

  void insertAtIndexInFabricante(int index, String value) {
    fabricante.insert(index, value);
  }

  List<String> _potencia = [];
  List<String> get potencia => _potencia;
  set potencia(List<String> value) {
    _potencia = value;
  }

  void addToPotencia(String value) {
    potencia.add(value);
  }

  void removeFromPotencia(String value) {
    potencia.remove(value);
  }

  void removeAtIndexFromPotencia(int index) {
    potencia.removeAt(index);
  }

  void updatePotenciaAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    potencia[index] = updateFn(_potencia[index]);
  }

  void insertAtIndexInPotencia(int index, String value) {
    potencia.insert(index, value);
  }

  List<String> _lampada = [];
  List<String> get lampada => _lampada;
  set lampada(List<String> value) {
    _lampada = value;
  }

  void addToLampada(String value) {
    lampada.add(value);
  }

  void removeFromLampada(String value) {
    lampada.remove(value);
  }

  void removeAtIndexFromLampada(int index) {
    lampada.removeAt(index);
  }

  void updateLampadaAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    lampada[index] = updateFn(_lampada[index]);
  }

  void insertAtIndexInLampada(int index, String value) {
    lampada.insert(index, value);
  }

  List<String> _luminaria = [];
  List<String> get luminaria => _luminaria;
  set luminaria(List<String> value) {
    _luminaria = value;
  }

  void addToLuminaria(String value) {
    luminaria.add(value);
  }

  void removeFromLuminaria(String value) {
    luminaria.remove(value);
  }

  void removeAtIndexFromLuminaria(int index) {
    luminaria.removeAt(index);
  }

  void updateLuminariaAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    luminaria[index] = updateFn(_luminaria[index]);
  }

  void insertAtIndexInLuminaria(int index, String value) {
    luminaria.insert(index, value);
  }

  List<String> _idd = [];
  List<String> get idd => _idd;
  set idd(List<String> value) {
    _idd = value;
  }

  void addToIdd(String value) {
    idd.add(value);
  }

  void removeFromIdd(String value) {
    idd.remove(value);
  }

  void removeAtIndexFromIdd(int index) {
    idd.removeAt(index);
  }

  void updateIddAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    idd[index] = updateFn(_idd[index]);
  }

  void insertAtIndexInIdd(int index, String value) {
    idd.insert(index, value);
  }

  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = value;
  }

  int _rotaSelecionada = 0;
  int get rotaSelecionada => _rotaSelecionada;
  set rotaSelecionada(int value) {
    _rotaSelecionada = value;
  }

  String _pontosIdsJson = '';
  String get pontosIdsJson => _pontosIdsJson;
  set pontosIdsJson(String value) {
    _pontosIdsJson = value;
  }

  List<LuminariasStruct> _luminarias = [];
  List<LuminariasStruct> get luminarias => _luminarias;
  set luminarias(List<LuminariasStruct> value) {
    _luminarias = value;
  }

  void addToLuminarias(LuminariasStruct value) {
    luminarias.add(value);
  }

  void removeFromLuminarias(LuminariasStruct value) {
    luminarias.remove(value);
  }

  void removeAtIndexFromLuminarias(int index) {
    luminarias.removeAt(index);
  }

  void updateLuminariasAtIndex(
    int index,
    LuminariasStruct Function(LuminariasStruct) updateFn,
  ) {
    luminarias[index] = updateFn(_luminarias[index]);
  }

  void insertAtIndexInLuminarias(int index, LuminariasStruct value) {
    luminarias.insert(index, value);
  }

  dynamic _luminariaEdit;
  dynamic get luminariaEdit => _luminariaEdit;
  set luminariaEdit(dynamic value) {
    _luminariaEdit = value;
  }

  int _refreshTrigger = 0;
  int get refreshTrigger => _refreshTrigger;
  set refreshTrigger(int value) {
    _refreshTrigger = value;
  }

  int _municipioID = 0;
  int get municipioID => _municipioID;
  set municipioID(int value) {
    _municipioID = value;
    prefs.setInt('ff_municipioID', value);
  }

  dynamic _history;
  dynamic get history => _history;
  set history(dynamic value) {
    _history = value;
  }

  SettingsStruct _settings = SettingsStruct();
  SettingsStruct get settings => _settings;
  set settings(SettingsStruct value) {
    _settings = value;
    prefs.setString('ff_settings', value.serialize());
  }

  void updateSettingsStruct(Function(SettingsStruct) updateFn) {
    updateFn(_settings);
    prefs.setString('ff_settings', _settings.serialize());
  }

  bool _sandbox = false;
  bool get sandbox => _sandbox;
  set sandbox(bool value) {
    _sandbox = value;
    prefs.setBool('ff_sandbox', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
