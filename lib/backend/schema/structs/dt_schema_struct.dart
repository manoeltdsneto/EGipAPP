// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtSchemaStruct extends BaseStruct {
  DtSchemaStruct({
    int? id,
    String? idPonto,
    String? municipio,
    int? codMunicipio,
    String? transformador,
    String? sequencia,
    String? chave,
    String? posicao,
    String? endereco,
    String? bairro,
    String? acervoPoste,
    String? medicao,
    String? medidorNc,
    String? localizacao,
    String? idd,
    String? tipoLampada,
    String? potencia,
    String? tipoLuminaria,
    String? fabricanteLuminaria,
    String? tipoRede,
    String? faseLigacao,
    String? idPmPlaca,
    String? medidorReferencia,
    String? utmX,
    String? utmY,
    String? latitude,
    String? longitude,
    String? zona,
    String? observacao,
    String? circuitoExclusivo,
    String? releFotoeletrico,
    String? medido,
    String? recenseado,
    String? dataRecenseamento,
    String? laudoTecnico,
    String? manutencoes,
    String? imagens,
    String? status,
    String? dataCadastro,
    String? updatedAt,
    int? isDeleted,
    String? tipoPoste,
    String? alturaPoste,
    String? tamanhoBraco,
    String? pontoNovo,
    String? alterado,
  })  : _id = id,
        _idPonto = idPonto,
        _municipio = municipio,
        _codMunicipio = codMunicipio,
        _transformador = transformador,
        _sequencia = sequencia,
        _chave = chave,
        _posicao = posicao,
        _endereco = endereco,
        _bairro = bairro,
        _acervoPoste = acervoPoste,
        _medicao = medicao,
        _medidorNc = medidorNc,
        _localizacao = localizacao,
        _idd = idd,
        _tipoLampada = tipoLampada,
        _potencia = potencia,
        _tipoLuminaria = tipoLuminaria,
        _fabricanteLuminaria = fabricanteLuminaria,
        _tipoRede = tipoRede,
        _faseLigacao = faseLigacao,
        _idPmPlaca = idPmPlaca,
        _medidorReferencia = medidorReferencia,
        _utmX = utmX,
        _utmY = utmY,
        _latitude = latitude,
        _longitude = longitude,
        _zona = zona,
        _observacao = observacao,
        _circuitoExclusivo = circuitoExclusivo,
        _releFotoeletrico = releFotoeletrico,
        _medido = medido,
        _recenseado = recenseado,
        _dataRecenseamento = dataRecenseamento,
        _laudoTecnico = laudoTecnico,
        _manutencoes = manutencoes,
        _imagens = imagens,
        _status = status,
        _dataCadastro = dataCadastro,
        _updatedAt = updatedAt,
        _isDeleted = isDeleted,
        _tipoPoste = tipoPoste,
        _alturaPoste = alturaPoste,
        _tamanhoBraco = tamanhoBraco,
        _pontoNovo = pontoNovo,
        _alterado = alterado;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "id_ponto" field.
  String? _idPonto;
  String get idPonto => _idPonto ?? '';
  set idPonto(String? val) => _idPonto = val;

  bool hasIdPonto() => _idPonto != null;

  // "municipio" field.
  String? _municipio;
  String get municipio => _municipio ?? '';
  set municipio(String? val) => _municipio = val;

  bool hasMunicipio() => _municipio != null;

  // "cod_municipio" field.
  int? _codMunicipio;
  int get codMunicipio => _codMunicipio ?? 0;
  set codMunicipio(int? val) => _codMunicipio = val;

  void incrementCodMunicipio(int amount) =>
      codMunicipio = codMunicipio + amount;

  bool hasCodMunicipio() => _codMunicipio != null;

  // "transformador" field.
  String? _transformador;
  String get transformador => _transformador ?? '';
  set transformador(String? val) => _transformador = val;

  bool hasTransformador() => _transformador != null;

  // "sequencia" field.
  String? _sequencia;
  String get sequencia => _sequencia ?? '';
  set sequencia(String? val) => _sequencia = val;

  bool hasSequencia() => _sequencia != null;

  // "chave" field.
  String? _chave;
  String get chave => _chave ?? '';
  set chave(String? val) => _chave = val;

  bool hasChave() => _chave != null;

  // "posicao" field.
  String? _posicao;
  String get posicao => _posicao ?? '';
  set posicao(String? val) => _posicao = val;

  bool hasPosicao() => _posicao != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  set endereco(String? val) => _endereco = val;

  bool hasEndereco() => _endereco != null;

  // "bairro" field.
  String? _bairro;
  String get bairro => _bairro ?? '';
  set bairro(String? val) => _bairro = val;

  bool hasBairro() => _bairro != null;

  // "acervo_poste" field.
  String? _acervoPoste;
  String get acervoPoste => _acervoPoste ?? '';
  set acervoPoste(String? val) => _acervoPoste = val;

  bool hasAcervoPoste() => _acervoPoste != null;

  // "medicao" field.
  String? _medicao;
  String get medicao => _medicao ?? '';
  set medicao(String? val) => _medicao = val;

  bool hasMedicao() => _medicao != null;

  // "medidor_nc" field.
  String? _medidorNc;
  String get medidorNc => _medidorNc ?? '';
  set medidorNc(String? val) => _medidorNc = val;

  bool hasMedidorNc() => _medidorNc != null;

  // "localizacao" field.
  String? _localizacao;
  String get localizacao => _localizacao ?? '';
  set localizacao(String? val) => _localizacao = val;

  bool hasLocalizacao() => _localizacao != null;

  // "idd" field.
  String? _idd;
  String get idd => _idd ?? '';
  set idd(String? val) => _idd = val;

  bool hasIdd() => _idd != null;

  // "tipo_lampada" field.
  String? _tipoLampada;
  String get tipoLampada => _tipoLampada ?? '';
  set tipoLampada(String? val) => _tipoLampada = val;

  bool hasTipoLampada() => _tipoLampada != null;

  // "potencia" field.
  String? _potencia;
  String get potencia => _potencia ?? '';
  set potencia(String? val) => _potencia = val;

  bool hasPotencia() => _potencia != null;

  // "tipo_luminaria" field.
  String? _tipoLuminaria;
  String get tipoLuminaria => _tipoLuminaria ?? '';
  set tipoLuminaria(String? val) => _tipoLuminaria = val;

  bool hasTipoLuminaria() => _tipoLuminaria != null;

  // "fabricante_luminaria" field.
  String? _fabricanteLuminaria;
  String get fabricanteLuminaria => _fabricanteLuminaria ?? '';
  set fabricanteLuminaria(String? val) => _fabricanteLuminaria = val;

  bool hasFabricanteLuminaria() => _fabricanteLuminaria != null;

  // "tipo_rede" field.
  String? _tipoRede;
  String get tipoRede => _tipoRede ?? '';
  set tipoRede(String? val) => _tipoRede = val;

  bool hasTipoRede() => _tipoRede != null;

  // "fase_ligacao" field.
  String? _faseLigacao;
  String get faseLigacao => _faseLigacao ?? '';
  set faseLigacao(String? val) => _faseLigacao = val;

  bool hasFaseLigacao() => _faseLigacao != null;

  // "id_pm_placa" field.
  String? _idPmPlaca;
  String get idPmPlaca => _idPmPlaca ?? '';
  set idPmPlaca(String? val) => _idPmPlaca = val;

  bool hasIdPmPlaca() => _idPmPlaca != null;

  // "medidor_referencia" field.
  String? _medidorReferencia;
  String get medidorReferencia => _medidorReferencia ?? '';
  set medidorReferencia(String? val) => _medidorReferencia = val;

  bool hasMedidorReferencia() => _medidorReferencia != null;

  // "utm_x" field.
  String? _utmX;
  String get utmX => _utmX ?? '';
  set utmX(String? val) => _utmX = val;

  bool hasUtmX() => _utmX != null;

  // "utm_y" field.
  String? _utmY;
  String get utmY => _utmY ?? '';
  set utmY(String? val) => _utmY = val;

  bool hasUtmY() => _utmY != null;

  // "latitude" field.
  String? _latitude;
  String get latitude => _latitude ?? '';
  set latitude(String? val) => _latitude = val;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  String? _longitude;
  String get longitude => _longitude ?? '';
  set longitude(String? val) => _longitude = val;

  bool hasLongitude() => _longitude != null;

  // "zona" field.
  String? _zona;
  String get zona => _zona ?? '';
  set zona(String? val) => _zona = val;

  bool hasZona() => _zona != null;

  // "observacao" field.
  String? _observacao;
  String get observacao => _observacao ?? '';
  set observacao(String? val) => _observacao = val;

  bool hasObservacao() => _observacao != null;

  // "circuito_exclusivo" field.
  String? _circuitoExclusivo;
  String get circuitoExclusivo => _circuitoExclusivo ?? '';
  set circuitoExclusivo(String? val) => _circuitoExclusivo = val;

  bool hasCircuitoExclusivo() => _circuitoExclusivo != null;

  // "rele_fotoeletrico" field.
  String? _releFotoeletrico;
  String get releFotoeletrico => _releFotoeletrico ?? '';
  set releFotoeletrico(String? val) => _releFotoeletrico = val;

  bool hasReleFotoeletrico() => _releFotoeletrico != null;

  // "medido" field.
  String? _medido;
  String get medido => _medido ?? '';
  set medido(String? val) => _medido = val;

  bool hasMedido() => _medido != null;

  // "recenseado" field.
  String? _recenseado;
  String get recenseado => _recenseado ?? '';
  set recenseado(String? val) => _recenseado = val;

  bool hasRecenseado() => _recenseado != null;

  // "data_recenseamento" field.
  String? _dataRecenseamento;
  String get dataRecenseamento => _dataRecenseamento ?? '';
  set dataRecenseamento(String? val) => _dataRecenseamento = val;

  bool hasDataRecenseamento() => _dataRecenseamento != null;

  // "laudo_tecnico" field.
  String? _laudoTecnico;
  String get laudoTecnico => _laudoTecnico ?? '';
  set laudoTecnico(String? val) => _laudoTecnico = val;

  bool hasLaudoTecnico() => _laudoTecnico != null;

  // "manutencoes" field.
  String? _manutencoes;
  String get manutencoes => _manutencoes ?? '';
  set manutencoes(String? val) => _manutencoes = val;

  bool hasManutencoes() => _manutencoes != null;

  // "imagens" field.
  String? _imagens;
  String get imagens => _imagens ?? '';
  set imagens(String? val) => _imagens = val;

  bool hasImagens() => _imagens != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "data_cadastro" field.
  String? _dataCadastro;
  String get dataCadastro => _dataCadastro ?? '';
  set dataCadastro(String? val) => _dataCadastro = val;

  bool hasDataCadastro() => _dataCadastro != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "is_deleted" field.
  int? _isDeleted;
  int get isDeleted => _isDeleted ?? 0;
  set isDeleted(int? val) => _isDeleted = val;

  void incrementIsDeleted(int amount) => isDeleted = isDeleted + amount;

  bool hasIsDeleted() => _isDeleted != null;

  // "tipo_poste" field.
  String? _tipoPoste;
  String get tipoPoste => _tipoPoste ?? '';
  set tipoPoste(String? val) => _tipoPoste = val;

  bool hasTipoPoste() => _tipoPoste != null;

  // "altura_poste" field.
  String? _alturaPoste;
  String get alturaPoste => _alturaPoste ?? '';
  set alturaPoste(String? val) => _alturaPoste = val;

  bool hasAlturaPoste() => _alturaPoste != null;

  // "tamanho_braco" field.
  String? _tamanhoBraco;
  String get tamanhoBraco => _tamanhoBraco ?? '';
  set tamanhoBraco(String? val) => _tamanhoBraco = val;

  bool hasTamanhoBraco() => _tamanhoBraco != null;

  // "ponto_novo" field.
  String? _pontoNovo;
  String get pontoNovo => _pontoNovo ?? '';
  set pontoNovo(String? val) => _pontoNovo = val;

  bool hasPontoNovo() => _pontoNovo != null;

  // "alterado" field.
  String? _alterado;
  String get alterado => _alterado ?? '';
  set alterado(String? val) => _alterado = val;

  bool hasAlterado() => _alterado != null;

  static DtSchemaStruct fromMap(Map<String, dynamic> data) => DtSchemaStruct(
        id: castToType<int>(data['id']),
        idPonto: data['id_ponto'] as String?,
        municipio: data['municipio'] as String?,
        codMunicipio: castToType<int>(data['cod_municipio']),
        transformador: data['transformador'] as String?,
        sequencia: data['sequencia'] as String?,
        chave: data['chave'] as String?,
        posicao: data['posicao'] as String?,
        endereco: data['endereco'] as String?,
        bairro: data['bairro'] as String?,
        acervoPoste: data['acervo_poste'] as String?,
        medicao: data['medicao'] as String?,
        medidorNc: data['medidor_nc'] as String?,
        localizacao: data['localizacao'] as String?,
        idd: data['idd'] as String?,
        tipoLampada: data['tipo_lampada'] as String?,
        potencia: data['potencia'] as String?,
        tipoLuminaria: data['tipo_luminaria'] as String?,
        fabricanteLuminaria: data['fabricante_luminaria'] as String?,
        tipoRede: data['tipo_rede'] as String?,
        faseLigacao: data['fase_ligacao'] as String?,
        idPmPlaca: data['id_pm_placa'] as String?,
        medidorReferencia: data['medidor_referencia'] as String?,
        utmX: data['utm_x'] as String?,
        utmY: data['utm_y'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
        zona: data['zona'] as String?,
        observacao: data['observacao'] as String?,
        circuitoExclusivo: data['circuito_exclusivo'] as String?,
        releFotoeletrico: data['rele_fotoeletrico'] as String?,
        medido: data['medido'] as String?,
        recenseado: data['recenseado'] as String?,
        dataRecenseamento: data['data_recenseamento'] as String?,
        laudoTecnico: data['laudo_tecnico'] as String?,
        manutencoes: data['manutencoes'] as String?,
        imagens: data['imagens'] as String?,
        status: data['status'] as String?,
        dataCadastro: data['data_cadastro'] as String?,
        updatedAt: data['updated_at'] as String?,
        isDeleted: castToType<int>(data['is_deleted']),
        tipoPoste: data['tipo_poste'] as String?,
        alturaPoste: data['altura_poste'] as String?,
        tamanhoBraco: data['tamanho_braco'] as String?,
        pontoNovo: data['ponto_novo'] as String?,
        alterado: data['alterado'] as String?,
      );

  static DtSchemaStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtSchemaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'id_ponto': _idPonto,
        'municipio': _municipio,
        'cod_municipio': _codMunicipio,
        'transformador': _transformador,
        'sequencia': _sequencia,
        'chave': _chave,
        'posicao': _posicao,
        'endereco': _endereco,
        'bairro': _bairro,
        'acervo_poste': _acervoPoste,
        'medicao': _medicao,
        'medidor_nc': _medidorNc,
        'localizacao': _localizacao,
        'idd': _idd,
        'tipo_lampada': _tipoLampada,
        'potencia': _potencia,
        'tipo_luminaria': _tipoLuminaria,
        'fabricante_luminaria': _fabricanteLuminaria,
        'tipo_rede': _tipoRede,
        'fase_ligacao': _faseLigacao,
        'id_pm_placa': _idPmPlaca,
        'medidor_referencia': _medidorReferencia,
        'utm_x': _utmX,
        'utm_y': _utmY,
        'latitude': _latitude,
        'longitude': _longitude,
        'zona': _zona,
        'observacao': _observacao,
        'circuito_exclusivo': _circuitoExclusivo,
        'rele_fotoeletrico': _releFotoeletrico,
        'medido': _medido,
        'recenseado': _recenseado,
        'data_recenseamento': _dataRecenseamento,
        'laudo_tecnico': _laudoTecnico,
        'manutencoes': _manutencoes,
        'imagens': _imagens,
        'status': _status,
        'data_cadastro': _dataCadastro,
        'updated_at': _updatedAt,
        'is_deleted': _isDeleted,
        'tipo_poste': _tipoPoste,
        'altura_poste': _alturaPoste,
        'tamanho_braco': _tamanhoBraco,
        'ponto_novo': _pontoNovo,
        'alterado': _alterado,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'id_ponto': serializeParam(
          _idPonto,
          ParamType.String,
        ),
        'municipio': serializeParam(
          _municipio,
          ParamType.String,
        ),
        'cod_municipio': serializeParam(
          _codMunicipio,
          ParamType.int,
        ),
        'transformador': serializeParam(
          _transformador,
          ParamType.String,
        ),
        'sequencia': serializeParam(
          _sequencia,
          ParamType.String,
        ),
        'chave': serializeParam(
          _chave,
          ParamType.String,
        ),
        'posicao': serializeParam(
          _posicao,
          ParamType.String,
        ),
        'endereco': serializeParam(
          _endereco,
          ParamType.String,
        ),
        'bairro': serializeParam(
          _bairro,
          ParamType.String,
        ),
        'acervo_poste': serializeParam(
          _acervoPoste,
          ParamType.String,
        ),
        'medicao': serializeParam(
          _medicao,
          ParamType.String,
        ),
        'medidor_nc': serializeParam(
          _medidorNc,
          ParamType.String,
        ),
        'localizacao': serializeParam(
          _localizacao,
          ParamType.String,
        ),
        'idd': serializeParam(
          _idd,
          ParamType.String,
        ),
        'tipo_lampada': serializeParam(
          _tipoLampada,
          ParamType.String,
        ),
        'potencia': serializeParam(
          _potencia,
          ParamType.String,
        ),
        'tipo_luminaria': serializeParam(
          _tipoLuminaria,
          ParamType.String,
        ),
        'fabricante_luminaria': serializeParam(
          _fabricanteLuminaria,
          ParamType.String,
        ),
        'tipo_rede': serializeParam(
          _tipoRede,
          ParamType.String,
        ),
        'fase_ligacao': serializeParam(
          _faseLigacao,
          ParamType.String,
        ),
        'id_pm_placa': serializeParam(
          _idPmPlaca,
          ParamType.String,
        ),
        'medidor_referencia': serializeParam(
          _medidorReferencia,
          ParamType.String,
        ),
        'utm_x': serializeParam(
          _utmX,
          ParamType.String,
        ),
        'utm_y': serializeParam(
          _utmY,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.String,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.String,
        ),
        'zona': serializeParam(
          _zona,
          ParamType.String,
        ),
        'observacao': serializeParam(
          _observacao,
          ParamType.String,
        ),
        'circuito_exclusivo': serializeParam(
          _circuitoExclusivo,
          ParamType.String,
        ),
        'rele_fotoeletrico': serializeParam(
          _releFotoeletrico,
          ParamType.String,
        ),
        'medido': serializeParam(
          _medido,
          ParamType.String,
        ),
        'recenseado': serializeParam(
          _recenseado,
          ParamType.String,
        ),
        'data_recenseamento': serializeParam(
          _dataRecenseamento,
          ParamType.String,
        ),
        'laudo_tecnico': serializeParam(
          _laudoTecnico,
          ParamType.String,
        ),
        'manutencoes': serializeParam(
          _manutencoes,
          ParamType.String,
        ),
        'imagens': serializeParam(
          _imagens,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'data_cadastro': serializeParam(
          _dataCadastro,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'is_deleted': serializeParam(
          _isDeleted,
          ParamType.int,
        ),
        'tipo_poste': serializeParam(
          _tipoPoste,
          ParamType.String,
        ),
        'altura_poste': serializeParam(
          _alturaPoste,
          ParamType.String,
        ),
        'tamanho_braco': serializeParam(
          _tamanhoBraco,
          ParamType.String,
        ),
        'ponto_novo': serializeParam(
          _pontoNovo,
          ParamType.String,
        ),
        'alterado': serializeParam(
          _alterado,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtSchemaStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtSchemaStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        idPonto: deserializeParam(
          data['id_ponto'],
          ParamType.String,
          false,
        ),
        municipio: deserializeParam(
          data['municipio'],
          ParamType.String,
          false,
        ),
        codMunicipio: deserializeParam(
          data['cod_municipio'],
          ParamType.int,
          false,
        ),
        transformador: deserializeParam(
          data['transformador'],
          ParamType.String,
          false,
        ),
        sequencia: deserializeParam(
          data['sequencia'],
          ParamType.String,
          false,
        ),
        chave: deserializeParam(
          data['chave'],
          ParamType.String,
          false,
        ),
        posicao: deserializeParam(
          data['posicao'],
          ParamType.String,
          false,
        ),
        endereco: deserializeParam(
          data['endereco'],
          ParamType.String,
          false,
        ),
        bairro: deserializeParam(
          data['bairro'],
          ParamType.String,
          false,
        ),
        acervoPoste: deserializeParam(
          data['acervo_poste'],
          ParamType.String,
          false,
        ),
        medicao: deserializeParam(
          data['medicao'],
          ParamType.String,
          false,
        ),
        medidorNc: deserializeParam(
          data['medidor_nc'],
          ParamType.String,
          false,
        ),
        localizacao: deserializeParam(
          data['localizacao'],
          ParamType.String,
          false,
        ),
        idd: deserializeParam(
          data['idd'],
          ParamType.String,
          false,
        ),
        tipoLampada: deserializeParam(
          data['tipo_lampada'],
          ParamType.String,
          false,
        ),
        potencia: deserializeParam(
          data['potencia'],
          ParamType.String,
          false,
        ),
        tipoLuminaria: deserializeParam(
          data['tipo_luminaria'],
          ParamType.String,
          false,
        ),
        fabricanteLuminaria: deserializeParam(
          data['fabricante_luminaria'],
          ParamType.String,
          false,
        ),
        tipoRede: deserializeParam(
          data['tipo_rede'],
          ParamType.String,
          false,
        ),
        faseLigacao: deserializeParam(
          data['fase_ligacao'],
          ParamType.String,
          false,
        ),
        idPmPlaca: deserializeParam(
          data['id_pm_placa'],
          ParamType.String,
          false,
        ),
        medidorReferencia: deserializeParam(
          data['medidor_referencia'],
          ParamType.String,
          false,
        ),
        utmX: deserializeParam(
          data['utm_x'],
          ParamType.String,
          false,
        ),
        utmY: deserializeParam(
          data['utm_y'],
          ParamType.String,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.String,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.String,
          false,
        ),
        zona: deserializeParam(
          data['zona'],
          ParamType.String,
          false,
        ),
        observacao: deserializeParam(
          data['observacao'],
          ParamType.String,
          false,
        ),
        circuitoExclusivo: deserializeParam(
          data['circuito_exclusivo'],
          ParamType.String,
          false,
        ),
        releFotoeletrico: deserializeParam(
          data['rele_fotoeletrico'],
          ParamType.String,
          false,
        ),
        medido: deserializeParam(
          data['medido'],
          ParamType.String,
          false,
        ),
        recenseado: deserializeParam(
          data['recenseado'],
          ParamType.String,
          false,
        ),
        dataRecenseamento: deserializeParam(
          data['data_recenseamento'],
          ParamType.String,
          false,
        ),
        laudoTecnico: deserializeParam(
          data['laudo_tecnico'],
          ParamType.String,
          false,
        ),
        manutencoes: deserializeParam(
          data['manutencoes'],
          ParamType.String,
          false,
        ),
        imagens: deserializeParam(
          data['imagens'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        dataCadastro: deserializeParam(
          data['data_cadastro'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        isDeleted: deserializeParam(
          data['is_deleted'],
          ParamType.int,
          false,
        ),
        tipoPoste: deserializeParam(
          data['tipo_poste'],
          ParamType.String,
          false,
        ),
        alturaPoste: deserializeParam(
          data['altura_poste'],
          ParamType.String,
          false,
        ),
        tamanhoBraco: deserializeParam(
          data['tamanho_braco'],
          ParamType.String,
          false,
        ),
        pontoNovo: deserializeParam(
          data['ponto_novo'],
          ParamType.String,
          false,
        ),
        alterado: deserializeParam(
          data['alterado'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtSchemaStruct &&
        id == other.id &&
        idPonto == other.idPonto &&
        municipio == other.municipio &&
        codMunicipio == other.codMunicipio &&
        transformador == other.transformador &&
        sequencia == other.sequencia &&
        chave == other.chave &&
        posicao == other.posicao &&
        endereco == other.endereco &&
        bairro == other.bairro &&
        acervoPoste == other.acervoPoste &&
        medicao == other.medicao &&
        medidorNc == other.medidorNc &&
        localizacao == other.localizacao &&
        idd == other.idd &&
        tipoLampada == other.tipoLampada &&
        potencia == other.potencia &&
        tipoLuminaria == other.tipoLuminaria &&
        fabricanteLuminaria == other.fabricanteLuminaria &&
        tipoRede == other.tipoRede &&
        faseLigacao == other.faseLigacao &&
        idPmPlaca == other.idPmPlaca &&
        medidorReferencia == other.medidorReferencia &&
        utmX == other.utmX &&
        utmY == other.utmY &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        zona == other.zona &&
        observacao == other.observacao &&
        circuitoExclusivo == other.circuitoExclusivo &&
        releFotoeletrico == other.releFotoeletrico &&
        medido == other.medido &&
        recenseado == other.recenseado &&
        dataRecenseamento == other.dataRecenseamento &&
        laudoTecnico == other.laudoTecnico &&
        manutencoes == other.manutencoes &&
        imagens == other.imagens &&
        status == other.status &&
        dataCadastro == other.dataCadastro &&
        updatedAt == other.updatedAt &&
        isDeleted == other.isDeleted &&
        tipoPoste == other.tipoPoste &&
        alturaPoste == other.alturaPoste &&
        tamanhoBraco == other.tamanhoBraco &&
        pontoNovo == other.pontoNovo &&
        alterado == other.alterado;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        idPonto,
        municipio,
        codMunicipio,
        transformador,
        sequencia,
        chave,
        posicao,
        endereco,
        bairro,
        acervoPoste,
        medicao,
        medidorNc,
        localizacao,
        idd,
        tipoLampada,
        potencia,
        tipoLuminaria,
        fabricanteLuminaria,
        tipoRede,
        faseLigacao,
        idPmPlaca,
        medidorReferencia,
        utmX,
        utmY,
        latitude,
        longitude,
        zona,
        observacao,
        circuitoExclusivo,
        releFotoeletrico,
        medido,
        recenseado,
        dataRecenseamento,
        laudoTecnico,
        manutencoes,
        imagens,
        status,
        dataCadastro,
        updatedAt,
        isDeleted,
        tipoPoste,
        alturaPoste,
        tamanhoBraco,
        pontoNovo,
        alterado
      ]);
}

DtSchemaStruct createDtSchemaStruct({
  int? id,
  String? idPonto,
  String? municipio,
  int? codMunicipio,
  String? transformador,
  String? sequencia,
  String? chave,
  String? posicao,
  String? endereco,
  String? bairro,
  String? acervoPoste,
  String? medicao,
  String? medidorNc,
  String? localizacao,
  String? idd,
  String? tipoLampada,
  String? potencia,
  String? tipoLuminaria,
  String? fabricanteLuminaria,
  String? tipoRede,
  String? faseLigacao,
  String? idPmPlaca,
  String? medidorReferencia,
  String? utmX,
  String? utmY,
  String? latitude,
  String? longitude,
  String? zona,
  String? observacao,
  String? circuitoExclusivo,
  String? releFotoeletrico,
  String? medido,
  String? recenseado,
  String? dataRecenseamento,
  String? laudoTecnico,
  String? manutencoes,
  String? imagens,
  String? status,
  String? dataCadastro,
  String? updatedAt,
  int? isDeleted,
  String? tipoPoste,
  String? alturaPoste,
  String? tamanhoBraco,
  String? pontoNovo,
  String? alterado,
}) =>
    DtSchemaStruct(
      id: id,
      idPonto: idPonto,
      municipio: municipio,
      codMunicipio: codMunicipio,
      transformador: transformador,
      sequencia: sequencia,
      chave: chave,
      posicao: posicao,
      endereco: endereco,
      bairro: bairro,
      acervoPoste: acervoPoste,
      medicao: medicao,
      medidorNc: medidorNc,
      localizacao: localizacao,
      idd: idd,
      tipoLampada: tipoLampada,
      potencia: potencia,
      tipoLuminaria: tipoLuminaria,
      fabricanteLuminaria: fabricanteLuminaria,
      tipoRede: tipoRede,
      faseLigacao: faseLigacao,
      idPmPlaca: idPmPlaca,
      medidorReferencia: medidorReferencia,
      utmX: utmX,
      utmY: utmY,
      latitude: latitude,
      longitude: longitude,
      zona: zona,
      observacao: observacao,
      circuitoExclusivo: circuitoExclusivo,
      releFotoeletrico: releFotoeletrico,
      medido: medido,
      recenseado: recenseado,
      dataRecenseamento: dataRecenseamento,
      laudoTecnico: laudoTecnico,
      manutencoes: manutencoes,
      imagens: imagens,
      status: status,
      dataCadastro: dataCadastro,
      updatedAt: updatedAt,
      isDeleted: isDeleted,
      tipoPoste: tipoPoste,
      alturaPoste: alturaPoste,
      tamanhoBraco: tamanhoBraco,
      pontoNovo: pontoNovo,
      alterado: alterado,
    );
