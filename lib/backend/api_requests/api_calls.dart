import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class BuscarUsuariosCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Buscar usuarios',
      apiUrl: 'http://egip.com.br/api/userList.php',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': '\tapplication/json',
        'Authorization':
            '\tBearer app_2bcd0ea6e9e01d52a390a142f92d6e4dc8c1a6b370cd7f47babe75eae978aadb',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].nome''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].email''',
      ));
  static String? senha(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].senha''',
      ));
  static String? permissoes(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].permissoes''',
      ));
  static List<String>? municipio(dynamic response) => (getJsonField(
        response,
        r'''$[:].municipio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BuscarMunicipioCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'buscarMunicipio',
      apiUrl: 'https://egip.com.br/api/municipioList.php',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            '\tBearer app_2bcd0ea6e9e01d52a390a142f92d6e4dc8c1a6b370cd7f47babe75eae978aadb',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EnviarCadastroAPICall {
  static Future<ApiCallResponse> call({
    String? idd = '',
    String? idPonto = '',
    String? municipio = '',
    int? codMunicipio,
    String? sequencia = '',
    String? transformador = '',
    String? chave = '',
    String? posicao = '',
    String? endereco = '',
    String? bairro = '',
    String? acervoPoste = '',
    String? medicao = '',
    String? medidorNc = '',
    String? localizacao = '',
    String? tipoLampada = '',
    String? potencia = '',
    String? tipoLuminaria = '',
    String? tipoRede = '',
    String? faseLigacao = '',
    String? idPmPlaca = '',
    String? medidorReferencia = '',
    String? latitude = '',
    String? longitude = '',
    String? zona = '',
    String? observacao = '',
    String? circuitoExclusivo = '',
    String? releFotoeletrico = '',
    String? recenseado = '',
  }) async {
    final ffApiRequestBody = '''
{
  "idd": "${escapeStringForJson(idd)}",
  "id_ponto": "${escapeStringForJson(idPonto)}",
  "municipio": "${escapeStringForJson(municipio)}",
  "cod_municipio": ${codMunicipio},
  "sequencia": "${escapeStringForJson(sequencia)}",
  "transformador": "${escapeStringForJson(transformador)}",
  "chave": "${escapeStringForJson(chave)}",
  "posicao": "${escapeStringForJson(posicao)}",
  "endereco": "${escapeStringForJson(endereco)}",
  "bairro": "${escapeStringForJson(bairro)}",
  "acervo_poste": "${escapeStringForJson(acervoPoste)}",
  "medicao": "${escapeStringForJson(medicao)}",
  "medidor_nc": "${escapeStringForJson(medidorNc)}",
  "localizacao": "${escapeStringForJson(localizacao)}",
  "tipo_lampada": "${escapeStringForJson(tipoLampada)}",
  "potencia": "${escapeStringForJson(potencia)}",
  "tipo_luminaria": "${escapeStringForJson(tipoLuminaria)}",
  "tipo_rede": "${escapeStringForJson(tipoRede)}",
  "fase_ligacao": "${escapeStringForJson(faseLigacao)}",
  "id_pm_placa": "${escapeStringForJson(idPmPlaca)}",
  "medidor_referencia": "${escapeStringForJson(medidorReferencia)}",
  "latitude": "${escapeStringForJson(latitude)}",
  "longitude": "${escapeStringForJson(longitude)}",
  "zona": "${escapeStringForJson(zona)}",
  "observacao": "${escapeStringForJson(observacao)}",
  "circuito_exclusivo": "${escapeStringForJson(circuitoExclusivo)}",
  "rele_fotoeletrico": "${escapeStringForJson(releFotoeletrico)}",
  "recenseado": "${escapeStringForJson(recenseado)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EnviarCadastroAPI',
      apiUrl: 'http://egip.com.br/api/inserir_ponto.php',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            '\tBearer app_2bcd0ea6e9e01d52a390a142f92d6e4dc8c1a6b370cd7f47babe75eae978aadb',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CadastroPontoViaApiCall {
  static Future<ApiCallResponse> call({
    dynamic? pontosJson,
  }) async {
    final pontos = _serializeJson(pontosJson);
    final ffApiRequestBody = '''
{
  "pontos": "${pontos}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cadastroPontoViaApi',
      apiUrl: 'http://egip.com.br/api/register_ponto.php',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            '\tBearer app_2bcd0ea6e9e01d52a390a142f92d6e4dc8c1a6b370cd7f47babe75eae978aadb',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuscarTodosOsPontosCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Buscar todos os pontos',
      apiUrl: 'http://egip.com.br/api/buscarPontos.php',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': '\tapplication/json',
        'Authorization':
            '\tBearer app_2bcd0ea6e9e01d52a390a142f92d6e4dc8c1a6b370cd7f47babe75eae978aadb',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MudarStatusDaSolicitacoesCall {
  static Future<ApiCallResponse> call({
    String? api = '',
    int? responsavel,
    int? id,
    String? status = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "status": "${escapeStringForJson(status)}",
  "id": ${id},
  "responsavel": ${responsavel}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Mudar status da solicitacoes',
      apiUrl: '${api}solicitacoes.php',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': '\tapplication/json',
        'Authorization': '\tBearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.mensagem''',
      ));
  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.sucesso''',
      ));
  static String? erro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.erro''',
      ));
}

class UpdateSolicitacoesCall {
  static Future<ApiCallResponse> call({
    String? api = '',
    String? token = '',
    String? dataConclusao = '',
    String? status = 'Concluído',
    int? id,
    int? responsavel,
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "data_conclusao": "${escapeStringForJson(dataConclusao)}",
  "status": "${escapeStringForJson(status)}",
  "responsavel": ${responsavel}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Solicitacoes',
      apiUrl: '${api}solicitacoes.php',
      callType: ApiCallType.PUT,
      headers: {
        'Content-Type': '\tapplication/json',
        'Authorization': '\tBearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
