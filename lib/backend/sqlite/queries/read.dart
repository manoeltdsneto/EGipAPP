import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN BUSCARPORCODIGO
Future<List<BuscarPorCodigoRow>> performBuscarPorCodigo(
  Database database, {
  int? codigo,
}) {
  final query = '''
select * from Municipio WHERE Codigo = '${codigo}'
''';
  return _readQuery(database, query, (d) => BuscarPorCodigoRow(d));
}

class BuscarPorCodigoRow extends SqliteRow {
  BuscarPorCodigoRow(Map<String, dynamic> data) : super(data);

  int? get codigo => data['Codigo'] as int?;
  String? get nome => data['Nome'] as String?;
  String? get uf => data['UF'] as String?;
}

/// END BUSCARPORCODIGO

/// BEGIN EXIBIR
Future<List<ExibirRow>> performExibir(
  Database database,
) {
  final query = '''
SELECT * FROM Municipio
''';
  return _readQuery(database, query, (d) => ExibirRow(d));
}

class ExibirRow extends SqliteRow {
  ExibirRow(Map<String, dynamic> data) : super(data);

  int? get codigo => data['Codigo'] as int?;
  String? get nome => data['Nome'] as String?;
  String? get uf => data['Uf'] as String?;
}

/// END EXIBIR

/// BEGIN EXIBIRMENOS
Future<List<ExibirmenosRow>> performExibirmenos(
  Database database,
) {
  final query = '''
SELECT * FROM Municipio ORDER BY Nome LIMIT 10;
''';
  return _readQuery(database, query, (d) => ExibirmenosRow(d));
}

class ExibirmenosRow extends SqliteRow {
  ExibirmenosRow(Map<String, dynamic> data) : super(data);

  int get id => data['Id'] as int;
  String get codigo => data['Codigo'] as String;
  String get nome => data['Nome'] as String;
  String get uf => data['Uf'] as String;
}

/// END EXIBIRMENOS

/// BEGIN QTDREGISTRO
Future<List<QtdRegistroRow>> performQtdRegistro(
  Database database,
) {
  final query = '''
SELECT COUNT(*) AS total FROM Municipio;
''';
  return _readQuery(database, query, (d) => QtdRegistroRow(d));
}

class QtdRegistroRow extends SqliteRow {
  QtdRegistroRow(Map<String, dynamic> data) : super(data);

  int? get total => data['total'] as int?;
}

/// END QTDREGISTRO

/// BEGIN INSERIR
Future<List<InserirRow>> performInserir(
  Database database, {
  int? codigo,
  String? nome,
  String? uf,
}) {
  final query = '''
INSERT INTO Municipio (Codigo, Nome, Uf) VALUES ('${codigo}', '${nome}', '${uf}');
''';
  return _readQuery(database, query, (d) => InserirRow(d));
}

class InserirRow extends SqliteRow {
  InserirRow(Map<String, dynamic> data) : super(data);
}

/// END INSERIR

/// BEGIN SELECTTIPOLAMPADA
Future<List<SelectTipoLampadaRow>> performSelectTipoLampada(
  Database database,
) {
  final query = '''
select * from tipo_lampada
''';
  return _readQuery(database, query, (d) => SelectTipoLampadaRow(d));
}

class SelectTipoLampadaRow extends SqliteRow {
  SelectTipoLampadaRow(Map<String, dynamic> data) : super(data);

  int get id => data['Id'] as int;
  String get nome => data['Nome'] as String;
}

/// END SELECTTIPOLAMPADA

/// BEGIN SELECTFASELIGACAO
Future<List<SelectFaseLigacaoRow>> performSelectFaseLigacao(
  Database database,
) {
  final query = '''
select * from fase_ligacao
''';
  return _readQuery(database, query, (d) => SelectFaseLigacaoRow(d));
}

class SelectFaseLigacaoRow extends SqliteRow {
  SelectFaseLigacaoRow(Map<String, dynamic> data) : super(data);

  int get id => data['Id'] as int;
  String get nome => data['Nome'] as String;
}

/// END SELECTFASELIGACAO

/// BEGIN SELECTPOTENCIA
Future<List<SelectPotenciaRow>> performSelectPotencia(
  Database database,
) {
  final query = '''
select * from potencia order by Potencia
''';
  return _readQuery(database, query, (d) => SelectPotenciaRow(d));
}

class SelectPotenciaRow extends SqliteRow {
  SelectPotenciaRow(Map<String, dynamic> data) : super(data);

  int get id => data['Id'] as int;
  int get potencia => data['Potencia'] as int;
}

/// END SELECTPOTENCIA

/// BEGIN SELECTTIPOLUMINARIA
Future<List<SelectTipoLuminariaRow>> performSelectTipoLuminaria(
  Database database,
) {
  final query = '''
select * from tipo_iluminaria
''';
  return _readQuery(database, query, (d) => SelectTipoLuminariaRow(d));
}

class SelectTipoLuminariaRow extends SqliteRow {
  SelectTipoLuminariaRow(Map<String, dynamic> data) : super(data);

  int get id => data['Id'] as int;
  String get nome => data['Nome'] as String;
}

/// END SELECTTIPOLUMINARIA

/// BEGIN SELECTTIPOREDE
Future<List<SelectTipoRedeRow>> performSelectTipoRede(
  Database database,
) {
  final query = '''
select * from tipo_rede
''';
  return _readQuery(database, query, (d) => SelectTipoRedeRow(d));
}

class SelectTipoRedeRow extends SqliteRow {
  SelectTipoRedeRow(Map<String, dynamic> data) : super(data);

  int get id => data['Id'] as int;
  String get nome => data['Nome'] as String;
}

/// END SELECTTIPOREDE

/// BEGIN INSERTTIPOLAMPADA
Future<List<InsertTipoLampadaRow>> performInsertTipoLampada(
  Database database, {
  String? nome,
}) {
  final query = '''
INSERT INTO tipo_lampada (Nome) VALUES ('${nome}')
''';
  return _readQuery(database, query, (d) => InsertTipoLampadaRow(d));
}

class InsertTipoLampadaRow extends SqliteRow {
  InsertTipoLampadaRow(Map<String, dynamic> data) : super(data);
}

/// END INSERTTIPOLAMPADA

/// BEGIN INSERTPOTENCIA
Future<List<InsertPotenciaRow>> performInsertPotencia(
  Database database, {
  int? valor,
}) {
  final query = '''
INSERT INTO potencia (Potencia) VALUES ('${valor}')
''';
  return _readQuery(database, query, (d) => InsertPotenciaRow(d));
}

class InsertPotenciaRow extends SqliteRow {
  InsertPotenciaRow(Map<String, dynamic> data) : super(data);
}

/// END INSERTPOTENCIA

/// BEGIN INSERTTIPOLUMINARIA
Future<List<InsertTipoLuminariaRow>> performInsertTipoLuminaria(
  Database database, {
  String? nome,
}) {
  final query = '''
INSERT INTO tipo_iluminaria (Nome) VALUES ('${nome}')
''';
  return _readQuery(database, query, (d) => InsertTipoLuminariaRow(d));
}

class InsertTipoLuminariaRow extends SqliteRow {
  InsertTipoLuminariaRow(Map<String, dynamic> data) : super(data);
}

/// END INSERTTIPOLUMINARIA

/// BEGIN INSERTFASELIGACAO
Future<List<InsertFaseLigacaoRow>> performInsertFaseLigacao(
  Database database, {
  String? nome,
}) {
  final query = '''
INSERT INTO fase_ligacao (Nome) VALUES ('${nome}')
''';
  return _readQuery(database, query, (d) => InsertFaseLigacaoRow(d));
}

class InsertFaseLigacaoRow extends SqliteRow {
  InsertFaseLigacaoRow(Map<String, dynamic> data) : super(data);
}

/// END INSERTFASELIGACAO

/// BEGIN INSERTTIPOREDE
Future<List<InsertTipoRedeRow>> performInsertTipoRede(
  Database database, {
  String? nome,
}) {
  final query = '''
INSERT INTO tipo_rede (Nome) VALUES ('${nome}')
''';
  return _readQuery(database, query, (d) => InsertTipoRedeRow(d));
}

class InsertTipoRedeRow extends SqliteRow {
  InsertTipoRedeRow(Map<String, dynamic> data) : super(data);
}

/// END INSERTTIPOREDE

/// BEGIN INSERTQUERYCADASTRO
Future<List<InsertQueryCadastroRow>> performInsertQueryCadastro(
  Database database, {
  int? idd,
  int? idPonto,
  int? codigoIbge,
  int? sequencia,
  int? codCliente,
  int? codCidade,
  String? cidade,
  String? uf,
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
  int? potencia,
  String? tipoLuminaria,
  String? tipoRede,
  String? faseLigacao,
  String? idPMPlaca,
  String? medidorReferencia,
  String? latitude,
  String? longitude,
  String? zona,
  String? observacao,
  String? circuitoExclusivo,
  String? releFotoeletrico,
}) {
  final query = '''
INSERT INTO cadastro (
  IDD, id_ponto, codigo_ibge, sequencia, cod_cliente, cod_cidade, cidade, uf,
  transformador, chave, posicao, endereco, bairro, acervo_poste,
  medicao, medidor_nc, localizacao, tipo_lampada, potencia,
  tipo_luminaria, tipo_rede, fase_ligacao, ID_PM_Placa,
  medidor_referencia, latitude, longitude, zona, observacao,
  circuito_exclusivo, rele_fotoeletrico
) VALUES (
  '${idd}', '${idPonto}', '${codigoIbge}', '${sequencia}', '${codCliente}', '${codCidade}', '${cidade}',
  '${uf}', '${transformador}', '${chave}', '${posicao}', '${endereco}', '${bairro}', '${acervoPoste}',
  '${medicao}', '${medidorNC}', '${localizacao}', '${tipoLampada}', '${potencia}',
  '${tipoLuminaria}', '${tipoRede}', '${faseLigacao}', '${idPMPlaca}',
  '${medidorReferencia}', '${latitude}', '${longitude}', '${zona}', '${observacao}',
  '${circuitoExclusivo}', '${releFotoeletrico}'
);
''';
  return _readQuery(database, query, (d) => InsertQueryCadastroRow(d));
}

class InsertQueryCadastroRow extends SqliteRow {
  InsertQueryCadastroRow(Map<String, dynamic> data) : super(data);
}

/// END INSERTQUERYCADASTRO

/// BEGIN SELECTQUERYCADASTRO
Future<List<SelectQueryCadastroRow>> performSelectQueryCadastro(
  Database database,
) {
  final query = '''
SELECT *
FROM cadastro 
order by Id
''';
  return _readQuery(database, query, (d) => SelectQueryCadastroRow(d));
}

class SelectQueryCadastroRow extends SqliteRow {
  SelectQueryCadastroRow(Map<String, dynamic> data) : super(data);

  int get id => data['Id'] as int;
  int get idd => data['IDD'] as int;
  int get idPonto => data['id_ponto'] as int;
  int get codigoIbge => data['codigo_ibge'] as int;
  int get sequencia => data['sequencia'] as int;
  int get codCliente => data['cod_cliente'] as int;
  int get codCidade => data['cod_cidade'] as int;
  String get cidade => data['cidade'] as String;
  String get uf => data['uf'] as String;
  String get transformador => data['transformador'] as String;
  String get chave => data['chave'] as String;
  String get posicao => data['posicao'] as String;
  String get endereco => data['endereco'] as String;
  String get bairro => data['bairro'] as String;
  String get acervoPoste => data['acervo_poste'] as String;
  String get medicao => data['medicao'] as String;
  String get medidorNc => data['medidor_nc'] as String;
  String get localizacao => data['localizacao'] as String;
  String get tipoLampada => data['tipo_lampada'] as String;
  int get potencia => data['potencia'] as int;
  String get tipoLuminaria => data['tipo_luminaria'] as String;
  String get tipoRede => data['tipo_rede'] as String;
  String get faseLigacao => data['fase_ligacao'] as String;
  String get iDPMPlaca => data['ID_PM_Placa'] as String;
  String get medidorReferencia => data['medidor_referencia'] as String;
  String get latitude => data['latitude'] as String;
  String get longitude => data['longitude'] as String;
  String get zona => data['zona'] as String;
  String get observacao => data['observacao'] as String;
  String get circuitoExclusivo => data['circuito_exclusivo'] as String;
  String get releFotoeletrico => data['rele_fotoeletrico'] as String;
}

/// END SELECTQUERYCADASTRO

/// BEGIN QUERYINSERTUSUARIOS
Future<List<QueryInsertUsuariosRow>> performQueryInsertUsuarios(
  Database database, {
  int? id,
  String? nome,
  String? email,
  String? permissoes,
  String? senha,
  int? municipio,
}) {
  final query = '''
INSERT INTO usuarios (id, nome, email, municipio, permissoes, senha) VALUES ('${id}','${nome}', '${email}', '${municipio}', '${permissoes}', '${senha}')
''';
  return _readQuery(database, query, (d) => QueryInsertUsuariosRow(d));
}

class QueryInsertUsuariosRow extends SqliteRow {
  QueryInsertUsuariosRow(Map<String, dynamic> data) : super(data);
}

/// END QUERYINSERTUSUARIOS

/// BEGIN DELETEALLUSERS
Future<List<DeleteAllUsersRow>> performDeleteAllUsers(
  Database database,
) {
  final query = '''
DELETE FROM usuarios;
DELETE FROM sqlite_sequence WHERE name='usuarios';
''';
  return _readQuery(database, query, (d) => DeleteAllUsersRow(d));
}

class DeleteAllUsersRow extends SqliteRow {
  DeleteAllUsersRow(Map<String, dynamic> data) : super(data);
}

/// END DELETEALLUSERS

/// BEGIN QUERYSELECTUSUARIOS
Future<List<QuerySelectUsuariosRow>> performQuerySelectUsuarios(
  Database database,
) {
  final query = '''
SELECT * FROM usuarios
''';
  return _readQuery(database, query, (d) => QuerySelectUsuariosRow(d));
}

class QuerySelectUsuariosRow extends SqliteRow {
  QuerySelectUsuariosRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get nome => data['nome'] as String;
  String get email => data['email'] as String;
  String get permissoes => data['permissoes'] as String;
  String get senha => data['senha'] as String;
  String get ultimoLogin => data['ultimo_login'] as String;
}

/// END QUERYSELECTUSUARIOS

/// BEGIN QUERYLOGIN
Future<List<QueryLoginRow>> performQueryLogin(
  Database database, {
  String? email,
  String? senha,
}) {
  final query = '''
SELECT * FROM usuarios 
WHERE email = '${email}'
AND senha = '${senha}'
''';
  return _readQuery(database, query, (d) => QueryLoginRow(d));
}

class QueryLoginRow extends SqliteRow {
  QueryLoginRow(Map<String, dynamic> data) : super(data);

  String get nome => data['nome'] as String;
  String get email => data['email'] as String;
  String get permissoes => data['permissoes'] as String;
  int get id => data['id'] as int;
  int get municipio => data['municipio'] as int;
}

/// END QUERYLOGIN

/// BEGIN SELECTBYIDUSUARIOS
Future<List<SelectByIDUsuariosRow>> performSelectByIDUsuarios(
  Database database, {
  String? id,
}) {
  final query = '''
SELECT * FROM usuarios WHERE id = '${id}'
''';
  return _readQuery(database, query, (d) => SelectByIDUsuariosRow(d));
}

class SelectByIDUsuariosRow extends SqliteRow {
  SelectByIDUsuariosRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get nome => data['nome'] as String;
  String get email => data['email'] as String;
  String get permissoes => data['permissoes'] as String;
}

/// END SELECTBYIDUSUARIOS

/// BEGIN QUEROINSERTMUNICIPIO
Future<List<QueroInsertMunicipioRow>> performQueroInsertMunicipio(
  Database database, {
  int? id,
  String? municipio,
  String? codIbge,
  String? status,
}) {
  final query = '''
INSERT INTO municipios_recenseamento (id, municipio, cod_ibge, status) 
VALUES ('${id}', '${municipio}', '${codIbge}', '${status}');
''';
  return _readQuery(database, query, (d) => QueroInsertMunicipioRow(d));
}

class QueroInsertMunicipioRow extends SqliteRow {
  QueroInsertMunicipioRow(Map<String, dynamic> data) : super(data);
}

/// END QUEROINSERTMUNICIPIO

/// BEGIN QUEROSELECTMUNICIPIO
Future<List<QueroSelectMunicipioRow>> performQueroSelectMunicipio(
  Database database,
) {
  final query = '''
SELECT * FROM municipios_recenseamento
''';
  return _readQuery(database, query, (d) => QueroSelectMunicipioRow(d));
}

class QueroSelectMunicipioRow extends SqliteRow {
  QueroSelectMunicipioRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get municipio => data['municipio'] as String;
  String get codIbge => data['cod_ibge'] as String;
  String get status => data['status'] as String;
}

/// END QUEROSELECTMUNICIPIO

/// BEGIN SELECTBYNAMEMUNICIPIO
Future<List<SelectByNameMunicipioRow>> performSelectByNameMunicipio(
  Database database, {
  String? nome,
}) {
  final query = '''
select * from Municipio WHERE Nome = '${nome}'
''';
  return _readQuery(database, query, (d) => SelectByNameMunicipioRow(d));
}

class SelectByNameMunicipioRow extends SqliteRow {
  SelectByNameMunicipioRow(Map<String, dynamic> data) : super(data);

  int get codigo => data['Codigo'] as int;
  String get nome => data['Nome'] as String;
  String get uf => data['UF'] as String;
}

/// END SELECTBYNAMEMUNICIPIO

/// BEGIN QUERYDELETEALLMUNICIPIO
Future<List<QueryDeleteAllMunicipioRow>> performQueryDeleteAllMunicipio(
  Database database,
) {
  final query = '''
DELETE FROM municipios_recenseamento;
DELETE FROM sqlite_sequence WHERE name='municipios_recenseamento';
''';
  return _readQuery(database, query, (d) => QueryDeleteAllMunicipioRow(d));
}

class QueryDeleteAllMunicipioRow extends SqliteRow {
  QueryDeleteAllMunicipioRow(Map<String, dynamic> data) : super(data);
}

/// END QUERYDELETEALLMUNICIPIO

/// BEGIN CADASTRARPONTOS
Future<List<CadastrarPontosRow>> performCadastrarPontos(
  Database database, {
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
  String? idPMPlaca,
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
  int? sincronizado,
}) {
  final query = '''
INSERT INTO pontos (
   idd, id_ponto, municipio, cod_municipio, sequencia, transformador, chave,
  posicao, endereco, bairro, acervo_poste, medicao, medidor_nc, localizacao,
  tipo_lampada, potencia, tipo_luminaria, tipo_rede, fase_ligacao,
  id_pm_placa, medidor_referencia, latitude, longitude, zona, observacao,
  circuito_exclusivo, rele_fotoeletrico, recenseado, imagens, laudo_tecnico, sincronizado
) VALUES (
  '${idd}', '${idPonto}', '${municipio}', '${codMunicipio}', '${sequencia}', 
  '${transformador}', '${chave}', '${posicao}', '${endereco}', '${bairro}', '${acervoPoste}',
  '${medicao}', '${medidorNC}', '${localizacao}', '${tipoLampada}', '${potencia}',
  '${tipoLuminaria}', '${tipoRede}', '${faseLigacao}', '${idPMPlaca}',
  '${medidorReferencia}', '${latitude}', '${longitude}', '${zona}', '${observacao}',
  '${circuitoExclusivo}', '${releFotoeletrico}'
, '${recenseado}', '${imagens}', '${laudoTecnico}', '${sincronizado}'
);
''';
  return _readQuery(database, query, (d) => CadastrarPontosRow(d));
}

class CadastrarPontosRow extends SqliteRow {
  CadastrarPontosRow(Map<String, dynamic> data) : super(data);
}

/// END CADASTRARPONTOS

/// BEGIN DTDELETEITEM
Future<List<DtDeleteItemRow>> performDtDeleteItem(
  Database database, {
  String? tabela,
  int? id,
}) {
  final query = '''
DELETE FROM '${tabela}' WHERE id = '${id}'
''';
  return _readQuery(database, query, (d) => DtDeleteItemRow(d));
}

class DtDeleteItemRow extends SqliteRow {
  DtDeleteItemRow(Map<String, dynamic> data) : super(data);
}

/// END DTDELETEITEM

/// BEGIN BUSCARPONTOSCADASTRADOS
Future<List<BuscarPontosCadastradosRow>> performBuscarPontosCadastrados(
  Database database,
) {
  final query = '''
SELECT *
FROM pontos 
order by Id
''';
  return _readQuery(database, query, (d) => BuscarPontosCadastradosRow(d));
}

class BuscarPontosCadastradosRow extends SqliteRow {
  BuscarPontosCadastradosRow(Map<String, dynamic> data) : super(data);

  int get id => data['Id'] as int;
  String get idd => data['idd'] as String;
  String get idPonto => data['id_ponto'] as String;
  String get municipio => data['municipio'] as String;
  int get codMunicipio => data['cod_municipio'] as int;
  String get sequencia => data['sequencia'] as String;
  String get transformador => data['transformador'] as String;
  String get chave => data['chave'] as String;
  String get posicao => data['posicao'] as String;
  String get endereco => data['endereco'] as String;
  String get bairro => data['bairro'] as String;
  String get acervoPoste => data['acervo_poste'] as String;
  String get medicao => data['medicao'] as String;
  String get medidorNc => data['medidor_nc'] as String;
  String get localizacao => data['localizacao'] as String;
  String get tipoLampada => data['tipo_lampada'] as String;
  String get potencia => data['potencia'] as String;
  String get tipoLuminaria => data['tipo_luminaria'] as String;
  String get tipoRede => data['tipo_rede'] as String;
  String get faseLigacao => data['fase_ligacao'] as String;
  String get idPmPlaca => data['id_pm_placa'] as String;
  String get medidorReferencia => data['medidor_referencia'] as String;
  String get latitude => data['latitude'] as String;
  String get longitude => data['longitude'] as String;
  String get zona => data['zona'] as String;
  String get observacao => data['observacao'] as String;
  String get circuitoExclusivo => data['circuito_exclusivo'] as String;
  String get releFotoeletrico => data['rele_fotoeletrico'] as String;
  String get recenseado => data['recenseado'] as String;
  String get imagens => data['imagens'] as String;
  String get laudoTecnico => data['laudo_tecnico'] as String;
  String get fabricanteLuminaria => data['fabricante_luminaria'] as String;
}

/// END BUSCARPONTOSCADASTRADOS

/// BEGIN DELETEALLPONTOS
Future<List<DeleteAllPontosRow>> performDeleteAllPontos(
  Database database,
) {
  final query = '''
DELETE FROM pontos;
DELETE FROM sqlite_sequence WHERE name='pontos';
''';
  return _readQuery(database, query, (d) => DeleteAllPontosRow(d));
}

class DeleteAllPontosRow extends SqliteRow {
  DeleteAllPontosRow(Map<String, dynamic> data) : super(data);
}

/// END DELETEALLPONTOS

/// BEGIN SELECIONARMUNICIPIOATUAL
Future<List<SelecionarMunicipioAtualRow>> performSelecionarMunicipioAtual(
  Database database, {
  String? nome,
}) {
  final query = '''
select * from municipios_recenseamento WHERE municipio = '${nome}'
''';
  return _readQuery(database, query, (d) => SelecionarMunicipioAtualRow(d));
}

class SelecionarMunicipioAtualRow extends SqliteRow {
  SelecionarMunicipioAtualRow(Map<String, dynamic> data) : super(data);

  String get municipio => data['municipio'] as String;
  int get codigoIbge => data['codigo_ibge'] as int;
  String get status => data['status'] as String;
}

/// END SELECIONARMUNICIPIOATUAL

/// BEGIN QUANTIDADEREGISTROPONTO
Future<List<QuantidadeRegistroPontoRow>> performQuantidadeRegistroPonto(
  Database database,
) {
  final query = '''
SELECT COUNT(*) AS total FROM pontos;
''';
  return _readQuery(database, query, (d) => QuantidadeRegistroPontoRow(d));
}

class QuantidadeRegistroPontoRow extends SqliteRow {
  QuantidadeRegistroPontoRow(Map<String, dynamic> data) : super(data);

  int get total => data['total'] as int;
}

/// END QUANTIDADEREGISTROPONTO

/// BEGIN DELETEPONTOBYID
Future<List<DeletePontoByIdRow>> performDeletePontoById(
  Database database, {
  String? idd,
}) {
  final query = '''
DELETE FROM pontos WHERE idd = '${idd}'
''';
  return _readQuery(database, query, (d) => DeletePontoByIdRow(d));
}

class DeletePontoByIdRow extends SqliteRow {
  DeletePontoByIdRow(Map<String, dynamic> data) : super(data);
}

/// END DELETEPONTOBYID

/// BEGIN BUSCARPONTOSBYID
Future<List<BuscarPontosByIDRow>> performBuscarPontosByID(
  Database database, {
  int? id,
}) {
  final query = '''
SELECT *
FROM pontos 
WHERE id = '${id}'
''';
  return _readQuery(database, query, (d) => BuscarPontosByIDRow(d));
}

class BuscarPontosByIDRow extends SqliteRow {
  BuscarPontosByIDRow(Map<String, dynamic> data) : super(data);

  int get id => data['Id'] as int;
  String get idd => data['idd'] as String;
  String get idPonto => data['id_ponto'] as String;
  String get municipio => data['municipio'] as String;
  int get codMunicipio => data['cod_municipio'] as int;
  String get sequencia => data['sequencia'] as String;
  String get transformador => data['transformador'] as String;
  String get chave => data['chave'] as String;
  String get posicao => data['posicao'] as String;
  String get endereco => data['endereco'] as String;
  String get bairro => data['bairro'] as String;
  String get acervoPoste => data['acervo_poste'] as String;
  String get medicao => data['medicao'] as String;
  String get medidorNc => data['medidor_nc'] as String;
  String get localizacao => data['localizacao'] as String;
  String get tipoLampada => data['tipo_lampada'] as String;
  String get potencia => data['potencia'] as String;
  String get tipoLuminaria => data['tipo_luminaria'] as String;
  String get tipoRede => data['tipo_rede'] as String;
  String get faseLigacao => data['fase_ligacao'] as String;
  String get idPmPlaca => data['id_pm_placa'] as String;
  String get medidorReferencia => data['medidor_referencia'] as String;
  String get latitude => data['latitude'] as String;
  String get longitude => data['longitude'] as String;
  String get zona => data['zona'] as String;
  String get observacao => data['observacao'] as String;
  String get circuitoExclusivo => data['circuito_exclusivo'] as String;
  String get releFotoeletrico => data['rele_fotoeletrico'] as String;
  String get recenseado => data['recenseado'] as String;
  String get imagens => data['imagens'] as String;
  String get laudoTecnico => data['laudo_tecnico'] as String;
}

/// END BUSCARPONTOSBYID

/// BEGIN EDITARPONTO
Future<List<EditarPontoRow>> performEditarPonto(
  Database database, {
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
  String? idPMPlaca,
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
  String? updatedAT,
  int? sincronizado,
  int? id,
  String? fabricante,
}) {
  final query = '''
UPDATE pontos SET
  idd = '${idd}',
  id_ponto = '${idPonto}',
  municipio = '${municipio}',
  cod_municipio = '${codMunicipio}',
  sequencia = '${sequencia}',
  transformador = '${transformador}',
  chave = '${chave}',
  posicao = '${posicao}',
  endereco = '${endereco}',
  bairro = '${bairro}',
  acervo_poste = '${acervoPoste}',
  medicao = '${medicao}',
  medidor_nc = '${medidorNC}',
  localizacao = '${localizacao}',
  tipo_lampada = '${tipoLampada}',
  potencia = '${potencia}',
  tipo_luminaria = '${tipoLuminaria}',
  fabricante_luminaria = '${fabricante}',
  tipo_rede = '${tipoRede}',
  fase_ligacao = '${faseLigacao}',
  id_pm_placa = '${idPMPlaca}',
  medidor_referencia = '${medidorReferencia}',
  latitude = '${latitude}',
  longitude = '${longitude}',
  zona = '${zona}',
  observacao = '${observacao}',
  circuito_exclusivo = '${circuitoExclusivo}',
  rele_fotoeletrico = '${releFotoeletrico}',
  recenseado = '${recenseado}',
  imagens = '${imagens}'
,
  laudo_tecnico = '${laudoTecnico}',
  updated_at = '${updatedAT}',
  sincronizado = '${sincronizado}'
WHERE id = '${id}';
''';
  return _readQuery(database, query, (d) => EditarPontoRow(d));
}

class EditarPontoRow extends SqliteRow {
  EditarPontoRow(Map<String, dynamic> data) : super(data);
}

/// END EDITARPONTO

/// BEGIN SELECTLAUDOTECNICO
Future<List<SelectLaudoTecnicoRow>> performSelectLaudoTecnico(
  Database database,
) {
  final query = '''
select * from laudo_tecnico
''';
  return _readQuery(database, query, (d) => SelectLaudoTecnicoRow(d));
}

class SelectLaudoTecnicoRow extends SqliteRow {
  SelectLaudoTecnicoRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String? get nome => data['nome'] as String?;
}

/// END SELECTLAUDOTECNICO

/// BEGIN INSERTLAUDOTECNICO
Future<List<InsertLaudoTecnicoRow>> performInsertLaudoTecnico(
  Database database, {
  String? nome,
}) {
  final query = '''
INSERT INTO laudo_tecnico (nome) VALUES ('${nome}')
''';
  return _readQuery(database, query, (d) => InsertLaudoTecnicoRow(d));
}

class InsertLaudoTecnicoRow extends SqliteRow {
  InsertLaudoTecnicoRow(Map<String, dynamic> data) : super(data);
}

/// END INSERTLAUDOTECNICO

/// BEGIN PONTOSNAORECENSEADOS
Future<List<PontosNaorecenseadosRow>> performPontosNaorecenseados(
  Database database,
) {
  final query = '''
SELECT COUNT(*) AS total 
FROM pontos 
WHERE is_deleted = 0 
  AND (recenseado IS NULL OR TRIM(recenseado) = '' OR recenseado = 'NÃO');
''';
  return _readQuery(database, query, (d) => PontosNaorecenseadosRow(d));
}

class PontosNaorecenseadosRow extends SqliteRow {
  PontosNaorecenseadosRow(Map<String, dynamic> data) : super(data);

  int get total => data['total'] as int;
}

/// END PONTOSNAORECENSEADOS

/// BEGIN PONTOSRECENSEADOS
Future<List<PontosRecenseadosRow>> performPontosRecenseados(
  Database database,
) {
  final query = '''
SELECT COUNT(*) AS total FROM pontos WHERE recenseado = 'SIM'
''';
  return _readQuery(database, query, (d) => PontosRecenseadosRow(d));
}

class PontosRecenseadosRow extends SqliteRow {
  PontosRecenseadosRow(Map<String, dynamic> data) : super(data);

  int get total => data['total'] as int;
}

/// END PONTOSRECENSEADOS

/// BEGIN MARCARCOMODELETADO
Future<List<MarcarComoDeletadoRow>> performMarcarComoDeletado(
  Database database, {
  String? idPonto,
  String? data,
}) {
  final query = '''
UPDATE pontos
SET is_deleted = 1,
    deleted_at = '${data}',
    sincronizado = 0
WHERE id_ponto = '${idPonto}';
''';
  return _readQuery(database, query, (d) => MarcarComoDeletadoRow(d));
}

class MarcarComoDeletadoRow extends SqliteRow {
  MarcarComoDeletadoRow(Map<String, dynamic> data) : super(data);
}

/// END MARCARCOMODELETADO

/// BEGIN SELECTMUNICIPIOBYCODE
Future<List<SelectMunicipioByCodeRow>> performSelectMunicipioByCode(
  Database database, {
  int? codigo,
}) {
  final query = '''
select * from municipios_recenseamento WHERE cod_ibge = '${codigo}'
''';
  return _readQuery(database, query, (d) => SelectMunicipioByCodeRow(d));
}

class SelectMunicipioByCodeRow extends SqliteRow {
  SelectMunicipioByCodeRow(Map<String, dynamic> data) : super(data);

  String get municipio => data['municipio'] as String;
  int get codIbge => data['cod_ibge'] as int;
  int get id => data['id'] as int;
}

/// END SELECTMUNICIPIOBYCODE

/// BEGIN PONTOSCONCLUIDO
Future<List<PontosConcluidoRow>> performPontosConcluido(
  Database database,
) {
  final query = '''
SELECT COUNT(*) AS total_concluidos
FROM pontos
WHERE recenseado = 'SIM';
''';
  return _readQuery(database, query, (d) => PontosConcluidoRow(d));
}

class PontosConcluidoRow extends SqliteRow {
  PontosConcluidoRow(Map<String, dynamic> data) : super(data);

  int get totalConcluidos => data['total_concluidos'] as int;
}

/// END PONTOSCONCLUIDO

/// BEGIN PONTONAOCONCLUIDO
Future<List<PontoNaoConcluidoRow>> performPontoNaoConcluido(
  Database database,
) {
  final query = '''
SELECT
  COUNT(*) AS total_nao_recenseados
FROM pontos
WHERE recenseado IS NULL
   OR recenseado = ''
   OR recenseado <> 'SIM';
''';
  return _readQuery(database, query, (d) => PontoNaoConcluidoRow(d));
}

class PontoNaoConcluidoRow extends SqliteRow {
  PontoNaoConcluidoRow(Map<String, dynamic> data) : super(data);

  int get totalNaoRecenseados => data['total_nao_recenseados'] as int;
}

/// END PONTONAOCONCLUIDO

/// BEGIN PONTOSPENDENTES
Future<List<PontosPendentesRow>> performPontosPendentes(
  Database database,
) {
  final query = '''
SELECT * FROM pontos WHERE recenseado IS NULL
   OR recenseado = ''
   OR recenseado <> 'SIM' LIMIT 5
''';
  return _readQuery(database, query, (d) => PontosPendentesRow(d));
}

class PontosPendentesRow extends SqliteRow {
  PontosPendentesRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get idd => data['idd'] as String;
  String get idPonto => data['id_ponto'] as String;
  String get endereco => data['endereco'] as String;
  String get bairro => data['bairro'] as String;
  String get localizacao => data['localizacao'] as String;
  String get recenseado => data['recenseado'] as String;
}

/// END PONTOSPENDENTES

/// BEGIN ROTAS
Future<List<RotasRow>> performRotas(
  Database database,
) {
  final query = '''
SELECT * FROM rotas 
''';
  return _readQuery(database, query, (d) => RotasRow(d));
}

class RotasRow extends SqliteRow {
  RotasRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get nome => data['nome'] as String;
  int get recenseador => data['recenseador'] as int;
  int get total => data['total'] as int;
  String get origemLng => data['origem_lng'] as String;
  String get origemLat => data['origem_lat'] as String;
  String get destinoLat => data['destino_lat'] as String;
  String get destinoLng => data['destino_lng'] as String;
  String get waypointsJson => data['waypoints_json'] as String;
  String get pontosIdsJson => data['pontos_ids_json'] as String;
  String get dataCriacao => data['data_criacao'] as String;
  String get status => data['status'] as String;
}

/// END ROTAS

/// BEGIN TODOSPONTOSRECENSEADOS
Future<List<TodosPontosRecenseadosRow>> performTodosPontosRecenseados(
  Database database, {
  List<String>? idsList,
}) {
  final ids = idsList;
  final query = '''
SELECT COUNT(*) AS nao_recenseados
FROM pontos
WHERE id IN ([ids])
AND (recenseado IS NULL OR UPPER(recenseado) != 'SIM')
''';
  return _readQuery(database, query, (d) => TodosPontosRecenseadosRow(d));
}

class TodosPontosRecenseadosRow extends SqliteRow {
  TodosPontosRecenseadosRow(Map<String, dynamic> data) : super(data);

  int get naoRecenseados => data['nao_recenseados'] as int;
}

/// END TODOSPONTOSRECENSEADOS

/// BEGIN LISTADEROTAS
Future<List<ListaDeRotasRow>> performListaDeRotas(
  Database database,
) {
  final query = '''
select * from rotas
''';
  return _readQuery(database, query, (d) => ListaDeRotasRow(d));
}

class ListaDeRotasRow extends SqliteRow {
  ListaDeRotasRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get nome => data['nome'] as String;
}

/// END LISTADEROTAS

/// BEGIN TODOSOSPONTOSRECENSEADO
Future<List<TodosOsPontosRecenseadoRow>> performTodosOsPontosRecenseado(
  Database database, {
  String? idsSql,
}) {
  final query = '''
SELECT COUNT(*) AS nao_recenseados
FROM pontos
WHERE id IN (${idsSql})
AND (recenseado IS NULL OR UPPER(recenseado) != 'SIM')
''';
  return _readQuery(database, query, (d) => TodosOsPontosRecenseadoRow(d));
}

class TodosOsPontosRecenseadoRow extends SqliteRow {
  TodosOsPontosRecenseadoRow(Map<String, dynamic> data) : super(data);

  int get naoRecenseados => data['nao_recenseados'] as int;
}

/// END TODOSOSPONTOSRECENSEADO

/// BEGIN SELECIONARTODASLUMINARIAS
Future<List<SelecionarTodasLuminariasRow>> performSelecionarTodasLuminarias(
  Database database,
) {
  final query = '''
select * from luminarias 
''';
  return _readQuery(database, query, (d) => SelecionarTodasLuminariasRow(d));
}

class SelecionarTodasLuminariasRow extends SqliteRow {
  SelecionarTodasLuminariasRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  int get pontoId => data['ponto_id'] as int;
  String get idd => data['idd'] as String;
  String get tipoLampada => data['tipo_lampada'] as String;
  String get tipoLuminaria => data['tipo_luminaria'] as String;
  String get potencia => data['potencia'] as String;
  String get fabricanteLuminaria => data['fabricante_luminaria'] as String;
}

/// END SELECIONARTODASLUMINARIAS

/// BEGIN SELECIONARLUMINARIASBYID
Future<List<SelecionarLuminariasByIdRow>> performSelecionarLuminariasById(
  Database database, {
  int? id,
}) {
  final query = '''
select * from luminarias WHERE ponto_id = '${id}' LIMIT 4
''';
  return _readQuery(database, query, (d) => SelecionarLuminariasByIdRow(d));
}

class SelecionarLuminariasByIdRow extends SqliteRow {
  SelecionarLuminariasByIdRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  int get pontoId => data['ponto_id'] as int;
  String get idd => data['idd'] as String;
  String get tipoLampada => data['tipo_lampada'] as String;
  String get tipoLuminaria => data['tipo_luminaria'] as String;
  String get potencia => data['potencia'] as String;
  String get fabricanteLuminaria => data['fabricante_luminaria'] as String;
}

/// END SELECIONARLUMINARIASBYID

/// BEGIN COUNTLUMINARIAS
Future<List<CountLuminariasRow>> performCountLuminarias(
  Database database, {
  int? id,
}) {
  final query = '''
SELECT COUNT(*) AS total FROM luminarias WEHRE ponto_id = '${id}';
''';
  return _readQuery(database, query, (d) => CountLuminariasRow(d));
}

class CountLuminariasRow extends SqliteRow {
  CountLuminariasRow(Map<String, dynamic> data) : super(data);

  int get total => data['total'] as int;
}

/// END COUNTLUMINARIAS

/// BEGIN SELECIONARPONTOSBYIDPONTO
Future<List<SelecionarPontosByidPontoRow>> performSelecionarPontosByidPonto(
  Database database, {
  String? idPonto,
}) {
  final query = '''
SELECT * FROM pontos 
WHERE id_ponto = '${idPonto}' 
  AND is_deleted = 0
''';
  return _readQuery(database, query, (d) => SelecionarPontosByidPontoRow(d));
}

class SelecionarPontosByidPontoRow extends SqliteRow {
  SelecionarPontosByidPontoRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get idd => data['idd'] as String;
  String get idPonto => data['id_ponto'] as String;
  String get municipio => data['municipio'] as String;
  int get codMunicipio => data['cod_municipio'] as int;
  String get sequencia => data['sequencia'] as String;
  String get transformador => data['transformador'] as String;
  String get chave => data['chave'] as String;
  String get posicao => data['posicao'] as String;
  String get endereco => data['endereco'] as String;
  String get bairro => data['bairro'] as String;
  String get acervoPoste => data['acervo_poste'] as String;
  String get medicao => data['medicao'] as String;
  String get medidorNc => data['medidor_nc'] as String;
  String get localizacao => data['localizacao'] as String;
  String get tipoLampada => data['tipo_lampada'] as String;
  String get potencia => data['potencia'] as String;
  String get tipoLuminaria => data['tipo_luminaria'] as String;
  String get fabricanteLuminaria => data['fabricante_luminaria'] as String;
  String get tipoRede => data['tipo_rede'] as String;
  String get faseLigacao => data['fase_ligacao'] as String;
  String get idPmPlaca => data['id_pm_placa'] as String;
  String get medidorReferencia => data['medidor_referencia'] as String;
  String get latitude => data['latitude'] as String;
  String get longitude => data['longitude'] as String;
  String get zona => data['zona'] as String;
  String get observacao => data['observacao'] as String;
  String get circuitoExclusivo => data['circuito_exclusivo'] as String;
  String get releFotoeletrico => data['rele_fotoeletrico'] as String;
  String get medido => data['medido'] as String;
  String get recenseado => data['recenseado'] as String;
  String get dataRecenseamento => data['data_recenseamento'] as String;
  String get laudoTecnico => data['laudo_tecnico'] as String;
  String get manutencoes => data['manutencoes'] as String;
  String get imagens => data['imagens'] as String;
  String get alteracoes => data['alteracoes'] as String;
  String get responsavel => data['responsavel'] as String;
  String get dataCadastro => data['data_cadastro'] as String;
  String get updatedAt => data['updated_at'] as String;
  String get isDeleted => data['is_deleted'] as String;
  String get status => data['status'] as String;
  String get rotaId => data['rota_id'] as String;
}

/// END SELECIONARPONTOSBYIDPONTO

/// BEGIN CONTADORLUMINARIA
Future<List<ContadorLuminariaRow>> performContadorLuminaria(
  Database database, {
  String? idPonto,
}) {
  final query = '''
SELECT  COUNT(*) AS total FROM pontos WHERE id_ponto = '${idPonto}'
''';
  return _readQuery(database, query, (d) => ContadorLuminariaRow(d));
}

class ContadorLuminariaRow extends SqliteRow {
  ContadorLuminariaRow(Map<String, dynamic> data) : super(data);

  int get total => data['total'] as int;
}

/// END CONTADORLUMINARIA

/// BEGIN CONTARPONTOSDAROTA
Future<List<ContarPontosDaRotaRow>> performContarPontosDaRota(
  Database database, {
  String? ids,
}) {
  final query = '''
SELECT COUNT(DISTINCT id_ponto) AS total
FROM pontos
WHERE is_deleted = 0
  AND id IN ($ids)
''';
  return _readQuery(database, query, (d) => ContarPontosDaRotaRow(d));
}

class ContarPontosDaRotaRow extends SqliteRow {
  ContarPontosDaRotaRow(Map<String, dynamic> data) : super(data);

  int get total => data['total'] as int;
}

/// END CONTARPONTOSDAROTA

/// BEGIN TOTALPENDENTESDAROTA
Future<List<TotalPendentesDaRotaRow>> performTotalPendentesDaRota(
  Database database, {
  String? ids,
}) {
  final query = '''
SELECT COUNT(DISTINCT id_ponto) AS total
FROM pontos
WHERE is_deleted = 0
  AND id IN ($ids) 
  AND (
    recenseado IS NULL OR
    TRIM(recenseado) = '' OR
    UPPER(TRIM(recenseado)) != 'SIM'
  );
''';
  return _readQuery(database, query, (d) => TotalPendentesDaRotaRow(d));
}

class TotalPendentesDaRotaRow extends SqliteRow {
  TotalPendentesDaRotaRow(Map<String, dynamic> data) : super(data);

  int get total => data['total'] as int;
}

/// END TOTALPENDENTESDAROTA

/// BEGIN SELECTMANUTENCAO
Future<List<SelectManutencaoRow>> performSelectManutencao(
  Database database,
) {
  final query = '''
select * from manutencao
''';
  return _readQuery(database, query, (d) => SelectManutencaoRow(d));
}

class SelectManutencaoRow extends SqliteRow {
  SelectManutencaoRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get nome => data['nome'] as String;
}

/// END SELECTMANUTENCAO

/// BEGIN INSERTMANUTENCAO
Future<List<InsertManutencaoRow>> performInsertManutencao(
  Database database, {
  String? nome,
}) {
  final query = '''
INSERT INTO manutencao (nome) VALUES ('${nome}')
''';
  return _readQuery(database, query, (d) => InsertManutencaoRow(d));
}

class InsertManutencaoRow extends SqliteRow {
  InsertManutencaoRow(Map<String, dynamic> data) : super(data);
}

/// END INSERTMANUTENCAO

/// BEGIN SELECTTIPOPOSTE
Future<List<SelectTipoPosteRow>> performSelectTipoPoste(
  Database database,
) {
  final query = '''
select * from tipo_poste
''';
  return _readQuery(database, query, (d) => SelectTipoPosteRow(d));
}

class SelectTipoPosteRow extends SqliteRow {
  SelectTipoPosteRow(Map<String, dynamic> data) : super(data);

  String get nome => data['nome'] as String;
}

/// END SELECTTIPOPOSTE

/// BEGIN SELECTALTURAPOSTE
Future<List<SelectAlturaPosteRow>> performSelectAlturaPoste(
  Database database,
) {
  final query = '''
select * from altura_poste
''';
  return _readQuery(database, query, (d) => SelectAlturaPosteRow(d));
}

class SelectAlturaPosteRow extends SqliteRow {
  SelectAlturaPosteRow(Map<String, dynamic> data) : super(data);

  String get valor => data['valor'] as String;
  String get nome => data['nome'] as String;
}

/// END SELECTALTURAPOSTE

/// BEGIN SELECTTAMANHOBRACO
Future<List<SelectTamanhoBracoRow>> performSelectTamanhoBraco(
  Database database,
) {
  final query = '''
select * from tamanho_braco
''';
  return _readQuery(database, query, (d) => SelectTamanhoBracoRow(d));
}

class SelectTamanhoBracoRow extends SqliteRow {
  SelectTamanhoBracoRow(Map<String, dynamic> data) : super(data);

  String get valor => data['valor'] as String;
  String get nome => data['nome'] as String;
}

/// END SELECTTAMANHOBRACO

/// BEGIN TOTALRECENSEADOSHOJE
Future<List<TotalrecenseadoshojeRow>> performTotalrecenseadoshoje(
  Database database, {
  int? idUser,
}) {
  final query = '''
SELECT COUNT(*) AS total_recenseados_hoje
FROM pontos
WHERE UPPER(recenseado) = 'SIM'
  AND date(data_recenseamento) = date('now')
 AND cadastrado_por = '${idUser}'
  
''';
  return _readQuery(database, query, (d) => TotalrecenseadoshojeRow(d));
}

class TotalrecenseadoshojeRow extends SqliteRow {
  TotalrecenseadoshojeRow(Map<String, dynamic> data) : super(data);

  int get totalRecenseadosHoje => data['total_recenseados_hoje'] as int;
}

/// END TOTALRECENSEADOSHOJE

/// BEGIN DELETELUMINARIA
Future<List<DeleteLuminariaRow>> performDeleteLuminaria(
  Database database, {
  int? id,
  String? data,
}) {
  final query = '''
UPDATE pontos
SET is_deleted = 1,
    deleted_at = '${data}',
    sincronizado = 0
WHERE id = '${id}';
''';
  return _readQuery(database, query, (d) => DeleteLuminariaRow(d));
}

class DeleteLuminariaRow extends SqliteRow {
  DeleteLuminariaRow(Map<String, dynamic> data) : super(data);
}

/// END DELETELUMINARIA

/// BEGIN SELECIONARPONTOSCOMCODMUNICIPIOZERO
Future<List<SelecionarPontosComCodMunicipioZeroRow>>
    performSelecionarPontosComCodMunicipioZero(
  Database database,
) {
  final query = '''
SELECT * FROM pontos WHERE cod_municipio = 0
''';
  return _readQuery(
      database, query, (d) => SelecionarPontosComCodMunicipioZeroRow(d));
}

class SelecionarPontosComCodMunicipioZeroRow extends SqliteRow {
  SelecionarPontosComCodMunicipioZeroRow(Map<String, dynamic> data)
      : super(data);

  int get id => data['id'] as int;
  String get idPmPlaca => data['id_pm_placa'] as String;
}

/// END SELECIONARPONTOSCOMCODMUNICIPIOZERO

/// BEGIN CORRIGIRCODIGOMUNICIPIO
Future<List<CorrigirCodigoMunicipioRow>> performCorrigirCodigoMunicipio(
  Database database, {
  int? id,
}) {
  final query = '''
UPDATE pontos
SET municipio = 'JAGUARIBARA', cod_municipio = 2306801
    WHERE id = '${id}';
''';
  return _readQuery(database, query, (d) => CorrigirCodigoMunicipioRow(d));
}

class CorrigirCodigoMunicipioRow extends SqliteRow {
  CorrigirCodigoMunicipioRow(Map<String, dynamic> data) : super(data);
}

/// END CORRIGIRCODIGOMUNICIPIO

/// BEGIN SELECIONARSOLICITACOES
Future<List<SelecionarSolicitacoesRow>> performSelecionarSolicitacoes(
  Database database,
) {
  final query = '''
SELECT * FROM solicitacoes
''';
  return _readQuery(database, query, (d) => SelecionarSolicitacoesRow(d));
}

class SelecionarSolicitacoesRow extends SqliteRow {
  SelecionarSolicitacoesRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get tipo => data['tipo'] as String;
  String get prioridade => data['prioridade'] as String;
  int get referencia => data['referencia'] as int;
  String get observacoes => data['observacoes'] as String;
  String get dataAbertura => data['data_abertura'] as String;
  String? get dataConclusao => data['data_conclusao'] as String?;
  String get status => data['status'] as String;
  int get municipioId => data['municipio_id'] as int;
  int get pontoId => data['ponto_id'] as int;
  int get responsavel => data['responsavel'] as int;
}

/// END SELECIONARSOLICITACOES

/// BEGIN UPDATESOLICITACOES
Future<List<UpdateSolicitacoesRow>> performUpdateSolicitacoes(
  Database database, {
  int? id,
}) {
  final query = '''
UPDATE solicitacoes
SET status = 'Concluído'
WHERE id = '${id}';
''';
  return _readQuery(database, query, (d) => UpdateSolicitacoesRow(d));
}

class UpdateSolicitacoesRow extends SqliteRow {
  UpdateSolicitacoesRow(Map<String, dynamic> data) : super(data);
}

/// END UPDATESOLICITACOES

/// BEGIN VERIFICARSINCRONIZAO
Future<List<VerificarSincronizaoRow>> performVerificarSincronizao(
  Database database, {
  int? id,
}) {
  final query = '''
SELECT sincronizado FROM pontos WHERE id = '${id}'
''';
  return _readQuery(database, query, (d) => VerificarSincronizaoRow(d));
}

class VerificarSincronizaoRow extends SqliteRow {
  VerificarSincronizaoRow(Map<String, dynamic> data) : super(data);

  int get sincronizado => data['sincronizado'] as int;
}

/// END VERIFICARSINCRONIZAO

/// BEGIN QUANTIDADEPONTOSPARASINCRONAR
Future<List<QuantidadePontosParaSincronarRow>>
    performQuantidadePontosParaSincronar(
  Database database,
) {
  final query = '''
SELECT COUNT(*) AS total
FROM pontos
WHERE sincronizado = 0

''';
  return _readQuery(
      database, query, (d) => QuantidadePontosParaSincronarRow(d));
}

class QuantidadePontosParaSincronarRow extends SqliteRow {
  QuantidadePontosParaSincronarRow(Map<String, dynamic> data) : super(data);

  int get total => data['total'] as int;
}

/// END QUANTIDADEPONTOSPARASINCRONAR

/// BEGIN CONTARPONTOSDAFILA
Future<List<ContarPontosDaFilaRow>> performContarPontosDaFila(
  Database database,
) {
  final query = '''
SELECT COUNT(*) AS total
FROM fila
WHERE sincronizado = 0

''';
  return _readQuery(database, query, (d) => ContarPontosDaFilaRow(d));
}

class ContarPontosDaFilaRow extends SqliteRow {
  ContarPontosDaFilaRow(Map<String, dynamic> data) : super(data);

  int get total => data['total'] as int;
}

/// END CONTARPONTOSDAFILA
