// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CadastroStruct extends BaseStruct {
  CadastroStruct({
    int? id,
    String? idd,
    String? idPonto,
    int? codigoIbge,
    String? sequencia,
    String? codCliente,
    String? codCidade,
    String? cidade,
    String? uf,
    String? transformador,
    String? chave,
    String? posicao,
    String? endereco,
    String? bairro,
    String? acervoPoste,
    String? medicao,
    int? medidorNc,
    String? localizacao,
    String? tipoLampada,
    int? potencia,
    String? tipoLuminaria,
    String? tipoRede,
    String? faseLigacao,
    String? iDPMPlaca,
    String? medidorReferencia,
    String? latitude,
    String? longitude,
    int? zona,
    String? observacao,
    String? circuitoExclusivo,
    String? releFotoeletrico,
    String? recenseado,
    String? imagens,
    String? dataCadastro,
    DateTime? updatedAt,
    String? alterado,
  })  : _id = id,
        _idd = idd,
        _idPonto = idPonto,
        _codigoIbge = codigoIbge,
        _sequencia = sequencia,
        _codCliente = codCliente,
        _codCidade = codCidade,
        _cidade = cidade,
        _uf = uf,
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
        _iDPMPlaca = iDPMPlaca,
        _medidorReferencia = medidorReferencia,
        _latitude = latitude,
        _longitude = longitude,
        _zona = zona,
        _observacao = observacao,
        _circuitoExclusivo = circuitoExclusivo,
        _releFotoeletrico = releFotoeletrico,
        _recenseado = recenseado,
        _imagens = imagens,
        _dataCadastro = dataCadastro,
        _updatedAt = updatedAt,
        _alterado = alterado;

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "IDD" field.
  String? _idd;
  String get idd => _idd ?? '';
  set idd(String? val) => _idd = val;

  bool hasIdd() => _idd != null;

  // "id_ponto" field.
  String? _idPonto;
  String get idPonto => _idPonto ?? '';
  set idPonto(String? val) => _idPonto = val;

  bool hasIdPonto() => _idPonto != null;

  // "codigo_ibge" field.
  int? _codigoIbge;
  int get codigoIbge => _codigoIbge ?? 0;
  set codigoIbge(int? val) => _codigoIbge = val;

  void incrementCodigoIbge(int amount) => codigoIbge = codigoIbge + amount;

  bool hasCodigoIbge() => _codigoIbge != null;

  // "sequencia" field.
  String? _sequencia;
  String get sequencia => _sequencia ?? '';
  set sequencia(String? val) => _sequencia = val;

  bool hasSequencia() => _sequencia != null;

  // "cod_cliente" field.
  String? _codCliente;
  String get codCliente => _codCliente ?? '';
  set codCliente(String? val) => _codCliente = val;

  bool hasCodCliente() => _codCliente != null;

  // "cod_cidade" field.
  String? _codCidade;
  String get codCidade => _codCidade ?? '';
  set codCidade(String? val) => _codCidade = val;

  bool hasCodCidade() => _codCidade != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  set cidade(String? val) => _cidade = val;

  bool hasCidade() => _cidade != null;

  // "uf" field.
  String? _uf;
  String get uf => _uf ?? '';
  set uf(String? val) => _uf = val;

  bool hasUf() => _uf != null;

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
  int? _medidorNc;
  int get medidorNc => _medidorNc ?? 0;
  set medidorNc(int? val) => _medidorNc = val;

  void incrementMedidorNc(int amount) => medidorNc = medidorNc + amount;

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
  int? _potencia;
  int get potencia => _potencia ?? 0;
  set potencia(int? val) => _potencia = val;

  void incrementPotencia(int amount) => potencia = potencia + amount;

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

  // "ID_PM_Placa" field.
  String? _iDPMPlaca;
  String get iDPMPlaca => _iDPMPlaca ?? '';
  set iDPMPlaca(String? val) => _iDPMPlaca = val;

  bool hasIDPMPlaca() => _iDPMPlaca != null;

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
  int? _zona;
  int get zona => _zona ?? 0;
  set zona(int? val) => _zona = val;

  void incrementZona(int amount) => zona = zona + amount;

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

  // "data_cadastro" field.
  String? _dataCadastro;
  String get dataCadastro => _dataCadastro ?? '';
  set dataCadastro(String? val) => _dataCadastro = val;

  bool hasDataCadastro() => _dataCadastro != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "alterado" field.
  String? _alterado;
  String get alterado => _alterado ?? '';
  set alterado(String? val) => _alterado = val;

  bool hasAlterado() => _alterado != null;

  static CadastroStruct fromMap(Map<String, dynamic> data) => CadastroStruct(
        id: castToType<int>(data['Id']),
        idd: data['IDD'] as String?,
        idPonto: data['id_ponto'] as String?,
        codigoIbge: castToType<int>(data['codigo_ibge']),
        sequencia: data['sequencia'] as String?,
        codCliente: data['cod_cliente'] as String?,
        codCidade: data['cod_cidade'] as String?,
        cidade: data['cidade'] as String?,
        uf: data['uf'] as String?,
        transformador: data['transformador'] as String?,
        chave: data['chave'] as String?,
        posicao: data['posicao'] as String?,
        endereco: data['endereco'] as String?,
        bairro: data['bairro'] as String?,
        acervoPoste: data['acervo_poste'] as String?,
        medicao: data['medicao'] as String?,
        medidorNc: castToType<int>(data['medidor_nc']),
        localizacao: data['localizacao'] as String?,
        tipoLampada: data['tipo_lampada'] as String?,
        potencia: castToType<int>(data['potencia']),
        tipoLuminaria: data['tipo_luminaria'] as String?,
        tipoRede: data['tipo_rede'] as String?,
        faseLigacao: data['fase_ligacao'] as String?,
        iDPMPlaca: data['ID_PM_Placa'] as String?,
        medidorReferencia: data['medidor_referencia'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
        zona: castToType<int>(data['zona']),
        observacao: data['observacao'] as String?,
        circuitoExclusivo: data['circuito_exclusivo'] as String?,
        releFotoeletrico: data['rele_fotoeletrico'] as String?,
        recenseado: data['recenseado'] as String?,
        imagens: data['imagens'] as String?,
        dataCadastro: data['data_cadastro'] as String?,
        updatedAt: data['updated_at'] as DateTime?,
        alterado: data['alterado'] as String?,
      );

  static CadastroStruct? maybeFromMap(dynamic data) =>
      data is Map ? CadastroStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'IDD': _idd,
        'id_ponto': _idPonto,
        'codigo_ibge': _codigoIbge,
        'sequencia': _sequencia,
        'cod_cliente': _codCliente,
        'cod_cidade': _codCidade,
        'cidade': _cidade,
        'uf': _uf,
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
        'ID_PM_Placa': _iDPMPlaca,
        'medidor_referencia': _medidorReferencia,
        'latitude': _latitude,
        'longitude': _longitude,
        'zona': _zona,
        'observacao': _observacao,
        'circuito_exclusivo': _circuitoExclusivo,
        'rele_fotoeletrico': _releFotoeletrico,
        'recenseado': _recenseado,
        'imagens': _imagens,
        'data_cadastro': _dataCadastro,
        'updated_at': _updatedAt,
        'alterado': _alterado,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
        'IDD': serializeParam(
          _idd,
          ParamType.String,
        ),
        'id_ponto': serializeParam(
          _idPonto,
          ParamType.String,
        ),
        'codigo_ibge': serializeParam(
          _codigoIbge,
          ParamType.int,
        ),
        'sequencia': serializeParam(
          _sequencia,
          ParamType.String,
        ),
        'cod_cliente': serializeParam(
          _codCliente,
          ParamType.String,
        ),
        'cod_cidade': serializeParam(
          _codCidade,
          ParamType.String,
        ),
        'cidade': serializeParam(
          _cidade,
          ParamType.String,
        ),
        'uf': serializeParam(
          _uf,
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
          ParamType.int,
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
          ParamType.int,
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
        'ID_PM_Placa': serializeParam(
          _iDPMPlaca,
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
          ParamType.int,
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
        'data_cadastro': serializeParam(
          _dataCadastro,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'alterado': serializeParam(
          _alterado,
          ParamType.String,
        ),
      }.withoutNulls;

  static CadastroStruct fromSerializableMap(Map<String, dynamic> data) =>
      CadastroStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        idd: deserializeParam(
          data['IDD'],
          ParamType.String,
          false,
        ),
        idPonto: deserializeParam(
          data['id_ponto'],
          ParamType.String,
          false,
        ),
        codigoIbge: deserializeParam(
          data['codigo_ibge'],
          ParamType.int,
          false,
        ),
        sequencia: deserializeParam(
          data['sequencia'],
          ParamType.String,
          false,
        ),
        codCliente: deserializeParam(
          data['cod_cliente'],
          ParamType.String,
          false,
        ),
        codCidade: deserializeParam(
          data['cod_cidade'],
          ParamType.String,
          false,
        ),
        cidade: deserializeParam(
          data['cidade'],
          ParamType.String,
          false,
        ),
        uf: deserializeParam(
          data['uf'],
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
          ParamType.int,
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
          ParamType.int,
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
        iDPMPlaca: deserializeParam(
          data['ID_PM_Placa'],
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
          ParamType.int,
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
        dataCadastro: deserializeParam(
          data['data_cadastro'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        alterado: deserializeParam(
          data['alterado'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CadastroStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CadastroStruct &&
        id == other.id &&
        idd == other.idd &&
        idPonto == other.idPonto &&
        codigoIbge == other.codigoIbge &&
        sequencia == other.sequencia &&
        codCliente == other.codCliente &&
        codCidade == other.codCidade &&
        cidade == other.cidade &&
        uf == other.uf &&
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
        iDPMPlaca == other.iDPMPlaca &&
        medidorReferencia == other.medidorReferencia &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        zona == other.zona &&
        observacao == other.observacao &&
        circuitoExclusivo == other.circuitoExclusivo &&
        releFotoeletrico == other.releFotoeletrico &&
        recenseado == other.recenseado &&
        imagens == other.imagens &&
        dataCadastro == other.dataCadastro &&
        updatedAt == other.updatedAt &&
        alterado == other.alterado;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        idd,
        idPonto,
        codigoIbge,
        sequencia,
        codCliente,
        codCidade,
        cidade,
        uf,
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
        iDPMPlaca,
        medidorReferencia,
        latitude,
        longitude,
        zona,
        observacao,
        circuitoExclusivo,
        releFotoeletrico,
        recenseado,
        imagens,
        dataCadastro,
        updatedAt,
        alterado
      ]);
}

CadastroStruct createCadastroStruct({
  int? id,
  String? idd,
  String? idPonto,
  int? codigoIbge,
  String? sequencia,
  String? codCliente,
  String? codCidade,
  String? cidade,
  String? uf,
  String? transformador,
  String? chave,
  String? posicao,
  String? endereco,
  String? bairro,
  String? acervoPoste,
  String? medicao,
  int? medidorNc,
  String? localizacao,
  String? tipoLampada,
  int? potencia,
  String? tipoLuminaria,
  String? tipoRede,
  String? faseLigacao,
  String? iDPMPlaca,
  String? medidorReferencia,
  String? latitude,
  String? longitude,
  int? zona,
  String? observacao,
  String? circuitoExclusivo,
  String? releFotoeletrico,
  String? recenseado,
  String? imagens,
  String? dataCadastro,
  DateTime? updatedAt,
  String? alterado,
}) =>
    CadastroStruct(
      id: id,
      idd: idd,
      idPonto: idPonto,
      codigoIbge: codigoIbge,
      sequencia: sequencia,
      codCliente: codCliente,
      codCidade: codCidade,
      cidade: cidade,
      uf: uf,
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
      iDPMPlaca: iDPMPlaca,
      medidorReferencia: medidorReferencia,
      latitude: latitude,
      longitude: longitude,
      zona: zona,
      observacao: observacao,
      circuitoExclusivo: circuitoExclusivo,
      releFotoeletrico: releFotoeletrico,
      recenseado: recenseado,
      imagens: imagens,
      dataCadastro: dataCadastro,
      updatedAt: updatedAt,
      alterado: alterado,
    );
