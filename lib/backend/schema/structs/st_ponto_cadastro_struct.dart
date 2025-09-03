// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StPontoCadastroStruct extends BaseStruct {
  StPontoCadastroStruct({
    int? id,
    String? idd,
    String? idPonto,
    String? municipio,
    int? codMunicipio,
    String? sequencia,
    String? transformador,
    String? chave,
    String? posicao,
    String? endereco,
    String? bairro,
    String? acervoPoste,
    String? medicao,
    String? medidorNc,
    String? localizacao,
    String? tipoLampada,
    String? potencia,
    String? tipoLuminaria,
    String? tipoRede,
    String? faseLigacao,
    String? idPmPlaca,
    String? medidorReferencia,
    String? latitude,
    String? longitude,
    String? zona,
    String? observacao,
    String? circuitoExclusivo,
    String? releFotoeletrico,
    String? recenseado,
    String? imagens,
    String? laudoTecnico,
  })  : _id = id,
        _idd = idd,
        _idPonto = idPonto,
        _municipio = municipio,
        _codMunicipio = codMunicipio,
        _sequencia = sequencia,
        _transformador = transformador,
        _chave = chave,
        _posicao = posicao,
        _endereco = endereco,
        _bairro = bairro,
        _acervoPoste = acervoPoste,
        _medicao = medicao,
        _medidorNc = medidorNc,
        _localizacao = localizacao,
        _tipoLampada = tipoLampada,
        _potencia = potencia,
        _tipoLuminaria = tipoLuminaria,
        _tipoRede = tipoRede,
        _faseLigacao = faseLigacao,
        _idPmPlaca = idPmPlaca,
        _medidorReferencia = medidorReferencia,
        _latitude = latitude,
        _longitude = longitude,
        _zona = zona,
        _observacao = observacao,
        _circuitoExclusivo = circuitoExclusivo,
        _releFotoeletrico = releFotoeletrico,
        _recenseado = recenseado,
        _imagens = imagens,
        _laudoTecnico = laudoTecnico;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "idd" field.
  String? _idd;
  String get idd => _idd ?? '';
  set idd(String? val) => _idd = val;

  bool hasIdd() => _idd != null;

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

  // "sequencia" field.
  String? _sequencia;
  String get sequencia => _sequencia ?? '';
  set sequencia(String? val) => _sequencia = val;

  bool hasSequencia() => _sequencia != null;

  // "transformador" field.
  String? _transformador;
  String get transformador => _transformador ?? '';
  set transformador(String? val) => _transformador = val;

  bool hasTransformador() => _transformador != null;

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

  // "recenseado" field.
  String? _recenseado;
  String get recenseado => _recenseado ?? '';
  set recenseado(String? val) => _recenseado = val;

  bool hasRecenseado() => _recenseado != null;

  // "imagens" field.
  String? _imagens;
  String get imagens => _imagens ?? '';
  set imagens(String? val) => _imagens = val;

  bool hasImagens() => _imagens != null;

  // "laudo_tecnico" field.
  String? _laudoTecnico;
  String get laudoTecnico => _laudoTecnico ?? '';
  set laudoTecnico(String? val) => _laudoTecnico = val;

  bool hasLaudoTecnico() => _laudoTecnico != null;

  static StPontoCadastroStruct fromMap(Map<String, dynamic> data) =>
      StPontoCadastroStruct(
        id: castToType<int>(data['id']),
        idd: data['idd'] as String?,
        idPonto: data['id_ponto'] as String?,
        municipio: data['municipio'] as String?,
        codMunicipio: castToType<int>(data['cod_municipio']),
        sequencia: data['sequencia'] as String?,
        transformador: data['transformador'] as String?,
        chave: data['chave'] as String?,
        posicao: data['posicao'] as String?,
        endereco: data['endereco'] as String?,
        bairro: data['bairro'] as String?,
        acervoPoste: data['acervo_poste'] as String?,
        medicao: data['medicao'] as String?,
        medidorNc: data['medidor_nc'] as String?,
        localizacao: data['localizacao'] as String?,
        tipoLampada: data['tipo_lampada'] as String?,
        potencia: data['potencia'] as String?,
        tipoLuminaria: data['tipo_luminaria'] as String?,
        tipoRede: data['tipo_rede'] as String?,
        faseLigacao: data['fase_ligacao'] as String?,
        idPmPlaca: data['id_pm_placa'] as String?,
        medidorReferencia: data['medidor_referencia'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
        zona: data['zona'] as String?,
        observacao: data['observacao'] as String?,
        circuitoExclusivo: data['circuito_exclusivo'] as String?,
        releFotoeletrico: data['rele_fotoeletrico'] as String?,
        recenseado: data['recenseado'] as String?,
        imagens: data['imagens'] as String?,
        laudoTecnico: data['laudo_tecnico'] as String?,
      );

  static StPontoCadastroStruct? maybeFromMap(dynamic data) => data is Map
      ? StPontoCadastroStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'idd': _idd,
        'id_ponto': _idPonto,
        'municipio': _municipio,
        'cod_municipio': _codMunicipio,
        'sequencia': _sequencia,
        'transformador': _transformador,
        'chave': _chave,
        'posicao': _posicao,
        'endereco': _endereco,
        'bairro': _bairro,
        'acervo_poste': _acervoPoste,
        'medicao': _medicao,
        'medidor_nc': _medidorNc,
        'localizacao': _localizacao,
        'tipo_lampada': _tipoLampada,
        'potencia': _potencia,
        'tipo_luminaria': _tipoLuminaria,
        'tipo_rede': _tipoRede,
        'fase_ligacao': _faseLigacao,
        'id_pm_placa': _idPmPlaca,
        'medidor_referencia': _medidorReferencia,
        'latitude': _latitude,
        'longitude': _longitude,
        'zona': _zona,
        'observacao': _observacao,
        'circuito_exclusivo': _circuitoExclusivo,
        'rele_fotoeletrico': _releFotoeletrico,
        'recenseado': _recenseado,
        'imagens': _imagens,
        'laudo_tecnico': _laudoTecnico,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'idd': serializeParam(
          _idd,
          ParamType.String,
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
        'sequencia': serializeParam(
          _sequencia,
          ParamType.String,
        ),
        'transformador': serializeParam(
          _transformador,
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
        'recenseado': serializeParam(
          _recenseado,
          ParamType.String,
        ),
        'imagens': serializeParam(
          _imagens,
          ParamType.String,
        ),
        'laudo_tecnico': serializeParam(
          _laudoTecnico,
          ParamType.String,
        ),
      }.withoutNulls;

  static StPontoCadastroStruct fromSerializableMap(Map<String, dynamic> data) =>
      StPontoCadastroStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        idd: deserializeParam(
          data['idd'],
          ParamType.String,
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
        sequencia: deserializeParam(
          data['sequencia'],
          ParamType.String,
          false,
        ),
        transformador: deserializeParam(
          data['transformador'],
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
        recenseado: deserializeParam(
          data['recenseado'],
          ParamType.String,
          false,
        ),
        imagens: deserializeParam(
          data['imagens'],
          ParamType.String,
          false,
        ),
        laudoTecnico: deserializeParam(
          data['laudo_tecnico'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StPontoCadastroStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StPontoCadastroStruct &&
        id == other.id &&
        idd == other.idd &&
        idPonto == other.idPonto &&
        municipio == other.municipio &&
        codMunicipio == other.codMunicipio &&
        sequencia == other.sequencia &&
        transformador == other.transformador &&
        chave == other.chave &&
        posicao == other.posicao &&
        endereco == other.endereco &&
        bairro == other.bairro &&
        acervoPoste == other.acervoPoste &&
        medicao == other.medicao &&
        medidorNc == other.medidorNc &&
        localizacao == other.localizacao &&
        tipoLampada == other.tipoLampada &&
        potencia == other.potencia &&
        tipoLuminaria == other.tipoLuminaria &&
        tipoRede == other.tipoRede &&
        faseLigacao == other.faseLigacao &&
        idPmPlaca == other.idPmPlaca &&
        medidorReferencia == other.medidorReferencia &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        zona == other.zona &&
        observacao == other.observacao &&
        circuitoExclusivo == other.circuitoExclusivo &&
        releFotoeletrico == other.releFotoeletrico &&
        recenseado == other.recenseado &&
        imagens == other.imagens &&
        laudoTecnico == other.laudoTecnico;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        idd,
        idPonto,
        municipio,
        codMunicipio,
        sequencia,
        transformador,
        chave,
        posicao,
        endereco,
        bairro,
        acervoPoste,
        medicao,
        medidorNc,
        localizacao,
        tipoLampada,
        potencia,
        tipoLuminaria,
        tipoRede,
        faseLigacao,
        idPmPlaca,
        medidorReferencia,
        latitude,
        longitude,
        zona,
        observacao,
        circuitoExclusivo,
        releFotoeletrico,
        recenseado,
        imagens,
        laudoTecnico
      ]);
}

StPontoCadastroStruct createStPontoCadastroStruct({
  int? id,
  String? idd,
  String? idPonto,
  String? municipio,
  int? codMunicipio,
  String? sequencia,
  String? transformador,
  String? chave,
  String? posicao,
  String? endereco,
  String? bairro,
  String? acervoPoste,
  String? medicao,
  String? medidorNc,
  String? localizacao,
  String? tipoLampada,
  String? potencia,
  String? tipoLuminaria,
  String? tipoRede,
  String? faseLigacao,
  String? idPmPlaca,
  String? medidorReferencia,
  String? latitude,
  String? longitude,
  String? zona,
  String? observacao,
  String? circuitoExclusivo,
  String? releFotoeletrico,
  String? recenseado,
  String? imagens,
  String? laudoTecnico,
}) =>
    StPontoCadastroStruct(
      id: id,
      idd: idd,
      idPonto: idPonto,
      municipio: municipio,
      codMunicipio: codMunicipio,
      sequencia: sequencia,
      transformador: transformador,
      chave: chave,
      posicao: posicao,
      endereco: endereco,
      bairro: bairro,
      acervoPoste: acervoPoste,
      medicao: medicao,
      medidorNc: medidorNc,
      localizacao: localizacao,
      tipoLampada: tipoLampada,
      potencia: potencia,
      tipoLuminaria: tipoLuminaria,
      tipoRede: tipoRede,
      faseLigacao: faseLigacao,
      idPmPlaca: idPmPlaca,
      medidorReferencia: medidorReferencia,
      latitude: latitude,
      longitude: longitude,
      zona: zona,
      observacao: observacao,
      circuitoExclusivo: circuitoExclusivo,
      releFotoeletrico: releFotoeletrico,
      recenseado: recenseado,
      imagens: imagens,
      laudoTecnico: laudoTecnico,
    );
