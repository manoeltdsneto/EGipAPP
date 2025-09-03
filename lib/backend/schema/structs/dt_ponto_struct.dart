// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtPontoStruct extends BaseStruct {
  DtPontoStruct({
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
    String? medidorNC,
    String? localizacao,
    String? tipoLampada,
    String? potencia,
    String? tipoLuminaria,
    String? tipoRede,
    String? faseLigacao,
    String? idPMPLACA,
    String? medidorReferencia,
    String? latitude,
    String? longitude,
    String? zona,
    String? observacao,
    String? circuitoExclusivo,
    String? releFotoeletrico,
    String? recenseado,
  })  : _idd = idd,
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
        _medidorNC = medidorNC,
        _localizacao = localizacao,
        _tipoLampada = tipoLampada,
        _potencia = potencia,
        _tipoLuminaria = tipoLuminaria,
        _tipoRede = tipoRede,
        _faseLigacao = faseLigacao,
        _idPMPLACA = idPMPLACA,
        _medidorReferencia = medidorReferencia,
        _latitude = latitude,
        _longitude = longitude,
        _zona = zona,
        _observacao = observacao,
        _circuitoExclusivo = circuitoExclusivo,
        _releFotoeletrico = releFotoeletrico,
        _recenseado = recenseado;

  // "idd" field.
  String? _idd;
  String get idd => _idd ?? '';
  set idd(String? val) => _idd = val;

  bool hasIdd() => _idd != null;

  // "idPonto" field.
  String? _idPonto;
  String get idPonto => _idPonto ?? '';
  set idPonto(String? val) => _idPonto = val;

  bool hasIdPonto() => _idPonto != null;

  // "municipio" field.
  String? _municipio;
  String get municipio => _municipio ?? '';
  set municipio(String? val) => _municipio = val;

  bool hasMunicipio() => _municipio != null;

  // "codMunicipio" field.
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

  // "acervoPoste" field.
  String? _acervoPoste;
  String get acervoPoste => _acervoPoste ?? '';
  set acervoPoste(String? val) => _acervoPoste = val;

  bool hasAcervoPoste() => _acervoPoste != null;

  // "medicao" field.
  String? _medicao;
  String get medicao => _medicao ?? '';
  set medicao(String? val) => _medicao = val;

  bool hasMedicao() => _medicao != null;

  // "medidorNC" field.
  String? _medidorNC;
  String get medidorNC => _medidorNC ?? '';
  set medidorNC(String? val) => _medidorNC = val;

  bool hasMedidorNC() => _medidorNC != null;

  // "localizacao" field.
  String? _localizacao;
  String get localizacao => _localizacao ?? '';
  set localizacao(String? val) => _localizacao = val;

  bool hasLocalizacao() => _localizacao != null;

  // "tipoLampada" field.
  String? _tipoLampada;
  String get tipoLampada => _tipoLampada ?? '';
  set tipoLampada(String? val) => _tipoLampada = val;

  bool hasTipoLampada() => _tipoLampada != null;

  // "potencia" field.
  String? _potencia;
  String get potencia => _potencia ?? '';
  set potencia(String? val) => _potencia = val;

  bool hasPotencia() => _potencia != null;

  // "tipoLuminaria" field.
  String? _tipoLuminaria;
  String get tipoLuminaria => _tipoLuminaria ?? '';
  set tipoLuminaria(String? val) => _tipoLuminaria = val;

  bool hasTipoLuminaria() => _tipoLuminaria != null;

  // "tipoRede" field.
  String? _tipoRede;
  String get tipoRede => _tipoRede ?? '';
  set tipoRede(String? val) => _tipoRede = val;

  bool hasTipoRede() => _tipoRede != null;

  // "faseLigacao" field.
  String? _faseLigacao;
  String get faseLigacao => _faseLigacao ?? '';
  set faseLigacao(String? val) => _faseLigacao = val;

  bool hasFaseLigacao() => _faseLigacao != null;

  // "idPMPLACA" field.
  String? _idPMPLACA;
  String get idPMPLACA => _idPMPLACA ?? '';
  set idPMPLACA(String? val) => _idPMPLACA = val;

  bool hasIdPMPLACA() => _idPMPLACA != null;

  // "medidorReferencia" field.
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

  // "circuitoExclusivo" field.
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

  static DtPontoStruct fromMap(Map<String, dynamic> data) => DtPontoStruct(
        idd: data['idd'] as String?,
        idPonto: data['idPonto'] as String?,
        municipio: data['municipio'] as String?,
        codMunicipio: castToType<int>(data['codMunicipio']),
        sequencia: data['sequencia'] as String?,
        transformador: data['transformador'] as String?,
        chave: data['chave'] as String?,
        posicao: data['posicao'] as String?,
        endereco: data['endereco'] as String?,
        bairro: data['bairro'] as String?,
        acervoPoste: data['acervoPoste'] as String?,
        medicao: data['medicao'] as String?,
        medidorNC: data['medidorNC'] as String?,
        localizacao: data['localizacao'] as String?,
        tipoLampada: data['tipoLampada'] as String?,
        potencia: data['potencia'] as String?,
        tipoLuminaria: data['tipoLuminaria'] as String?,
        tipoRede: data['tipoRede'] as String?,
        faseLigacao: data['faseLigacao'] as String?,
        idPMPLACA: data['idPMPLACA'] as String?,
        medidorReferencia: data['medidorReferencia'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
        zona: data['zona'] as String?,
        observacao: data['observacao'] as String?,
        circuitoExclusivo: data['circuitoExclusivo'] as String?,
        releFotoeletrico: data['rele_fotoeletrico'] as String?,
        recenseado: data['recenseado'] as String?,
      );

  static DtPontoStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtPontoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'idd': _idd,
        'idPonto': _idPonto,
        'municipio': _municipio,
        'codMunicipio': _codMunicipio,
        'sequencia': _sequencia,
        'transformador': _transformador,
        'chave': _chave,
        'posicao': _posicao,
        'endereco': _endereco,
        'bairro': _bairro,
        'acervoPoste': _acervoPoste,
        'medicao': _medicao,
        'medidorNC': _medidorNC,
        'localizacao': _localizacao,
        'tipoLampada': _tipoLampada,
        'potencia': _potencia,
        'tipoLuminaria': _tipoLuminaria,
        'tipoRede': _tipoRede,
        'faseLigacao': _faseLigacao,
        'idPMPLACA': _idPMPLACA,
        'medidorReferencia': _medidorReferencia,
        'latitude': _latitude,
        'longitude': _longitude,
        'zona': _zona,
        'observacao': _observacao,
        'circuitoExclusivo': _circuitoExclusivo,
        'rele_fotoeletrico': _releFotoeletrico,
        'recenseado': _recenseado,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'idd': serializeParam(
          _idd,
          ParamType.String,
        ),
        'idPonto': serializeParam(
          _idPonto,
          ParamType.String,
        ),
        'municipio': serializeParam(
          _municipio,
          ParamType.String,
        ),
        'codMunicipio': serializeParam(
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
        'acervoPoste': serializeParam(
          _acervoPoste,
          ParamType.String,
        ),
        'medicao': serializeParam(
          _medicao,
          ParamType.String,
        ),
        'medidorNC': serializeParam(
          _medidorNC,
          ParamType.String,
        ),
        'localizacao': serializeParam(
          _localizacao,
          ParamType.String,
        ),
        'tipoLampada': serializeParam(
          _tipoLampada,
          ParamType.String,
        ),
        'potencia': serializeParam(
          _potencia,
          ParamType.String,
        ),
        'tipoLuminaria': serializeParam(
          _tipoLuminaria,
          ParamType.String,
        ),
        'tipoRede': serializeParam(
          _tipoRede,
          ParamType.String,
        ),
        'faseLigacao': serializeParam(
          _faseLigacao,
          ParamType.String,
        ),
        'idPMPLACA': serializeParam(
          _idPMPLACA,
          ParamType.String,
        ),
        'medidorReferencia': serializeParam(
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
        'circuitoExclusivo': serializeParam(
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
      }.withoutNulls;

  static DtPontoStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtPontoStruct(
        idd: deserializeParam(
          data['idd'],
          ParamType.String,
          false,
        ),
        idPonto: deserializeParam(
          data['idPonto'],
          ParamType.String,
          false,
        ),
        municipio: deserializeParam(
          data['municipio'],
          ParamType.String,
          false,
        ),
        codMunicipio: deserializeParam(
          data['codMunicipio'],
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
          data['acervoPoste'],
          ParamType.String,
          false,
        ),
        medicao: deserializeParam(
          data['medicao'],
          ParamType.String,
          false,
        ),
        medidorNC: deserializeParam(
          data['medidorNC'],
          ParamType.String,
          false,
        ),
        localizacao: deserializeParam(
          data['localizacao'],
          ParamType.String,
          false,
        ),
        tipoLampada: deserializeParam(
          data['tipoLampada'],
          ParamType.String,
          false,
        ),
        potencia: deserializeParam(
          data['potencia'],
          ParamType.String,
          false,
        ),
        tipoLuminaria: deserializeParam(
          data['tipoLuminaria'],
          ParamType.String,
          false,
        ),
        tipoRede: deserializeParam(
          data['tipoRede'],
          ParamType.String,
          false,
        ),
        faseLigacao: deserializeParam(
          data['faseLigacao'],
          ParamType.String,
          false,
        ),
        idPMPLACA: deserializeParam(
          data['idPMPLACA'],
          ParamType.String,
          false,
        ),
        medidorReferencia: deserializeParam(
          data['medidorReferencia'],
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
          data['circuitoExclusivo'],
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
      );

  @override
  String toString() => 'DtPontoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtPontoStruct &&
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
        medidorNC == other.medidorNC &&
        localizacao == other.localizacao &&
        tipoLampada == other.tipoLampada &&
        potencia == other.potencia &&
        tipoLuminaria == other.tipoLuminaria &&
        tipoRede == other.tipoRede &&
        faseLigacao == other.faseLigacao &&
        idPMPLACA == other.idPMPLACA &&
        medidorReferencia == other.medidorReferencia &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        zona == other.zona &&
        observacao == other.observacao &&
        circuitoExclusivo == other.circuitoExclusivo &&
        releFotoeletrico == other.releFotoeletrico &&
        recenseado == other.recenseado;
  }

  @override
  int get hashCode => const ListEquality().hash([
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
        medidorNC,
        localizacao,
        tipoLampada,
        potencia,
        tipoLuminaria,
        tipoRede,
        faseLigacao,
        idPMPLACA,
        medidorReferencia,
        latitude,
        longitude,
        zona,
        observacao,
        circuitoExclusivo,
        releFotoeletrico,
        recenseado
      ]);
}

DtPontoStruct createDtPontoStruct({
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
  String? medidorNC,
  String? localizacao,
  String? tipoLampada,
  String? potencia,
  String? tipoLuminaria,
  String? tipoRede,
  String? faseLigacao,
  String? idPMPLACA,
  String? medidorReferencia,
  String? latitude,
  String? longitude,
  String? zona,
  String? observacao,
  String? circuitoExclusivo,
  String? releFotoeletrico,
  String? recenseado,
}) =>
    DtPontoStruct(
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
      medidorNC: medidorNC,
      localizacao: localizacao,
      tipoLampada: tipoLampada,
      potencia: potencia,
      tipoLuminaria: tipoLuminaria,
      tipoRede: tipoRede,
      faseLigacao: faseLigacao,
      idPMPLACA: idPMPLACA,
      medidorReferencia: medidorReferencia,
      latitude: latitude,
      longitude: longitude,
      zona: zona,
      observacao: observacao,
      circuitoExclusivo: circuitoExclusivo,
      releFotoeletrico: releFotoeletrico,
      recenseado: recenseado,
    );
