import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'bdcoletor',
      'bdcoletor.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<BuscarPorCodigoRow>> buscarPorCodigo({
    int? codigo,
  }) =>
      performBuscarPorCodigo(
        _database,
        codigo: codigo,
      );

  Future<List<ExibirRow>> exibir() => performExibir(
        _database,
      );

  Future<List<ExibirmenosRow>> exibirmenos() => performExibirmenos(
        _database,
      );

  Future<List<QtdRegistroRow>> qtdRegistro() => performQtdRegistro(
        _database,
      );

  Future<List<InserirRow>> inserir({
    int? codigo,
    String? nome,
    String? uf,
  }) =>
      performInserir(
        _database,
        codigo: codigo,
        nome: nome,
        uf: uf,
      );

  Future<List<SelectTipoLampadaRow>> selectTipoLampada() =>
      performSelectTipoLampada(
        _database,
      );

  Future<List<SelectFaseLigacaoRow>> selectFaseLigacao() =>
      performSelectFaseLigacao(
        _database,
      );

  Future<List<SelectPotenciaRow>> selectPotencia() => performSelectPotencia(
        _database,
      );

  Future<List<SelectTipoLuminariaRow>> selectTipoLuminaria() =>
      performSelectTipoLuminaria(
        _database,
      );

  Future<List<SelectTipoRedeRow>> selectTipoRede() => performSelectTipoRede(
        _database,
      );

  Future<List<InsertTipoLampadaRow>> insertTipoLampada({
    String? nome,
  }) =>
      performInsertTipoLampada(
        _database,
        nome: nome,
      );

  Future<List<InsertPotenciaRow>> insertPotencia({
    int? valor,
  }) =>
      performInsertPotencia(
        _database,
        valor: valor,
      );

  Future<List<InsertTipoLuminariaRow>> insertTipoLuminaria({
    String? nome,
  }) =>
      performInsertTipoLuminaria(
        _database,
        nome: nome,
      );

  Future<List<InsertFaseLigacaoRow>> insertFaseLigacao({
    String? nome,
  }) =>
      performInsertFaseLigacao(
        _database,
        nome: nome,
      );

  Future<List<InsertTipoRedeRow>> insertTipoRede({
    String? nome,
  }) =>
      performInsertTipoRede(
        _database,
        nome: nome,
      );

  Future<List<InsertQueryCadastroRow>> insertQueryCadastro({
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
  }) =>
      performInsertQueryCadastro(
        _database,
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
        medidorNC: medidorNC,
        localizacao: localizacao,
        tipoLampada: tipoLampada,
        potencia: potencia,
        tipoLuminaria: tipoLuminaria,
        tipoRede: tipoRede,
        faseLigacao: faseLigacao,
        idPMPlaca: idPMPlaca,
        medidorReferencia: medidorReferencia,
        latitude: latitude,
        longitude: longitude,
        zona: zona,
        observacao: observacao,
        circuitoExclusivo: circuitoExclusivo,
        releFotoeletrico: releFotoeletrico,
      );

  Future<List<SelectQueryCadastroRow>> selectQueryCadastro() =>
      performSelectQueryCadastro(
        _database,
      );

  Future<List<QueryInsertUsuariosRow>> queryInsertUsuarios({
    int? id,
    String? nome,
    String? email,
    String? permissoes,
    String? senha,
    int? municipio,
  }) =>
      performQueryInsertUsuarios(
        _database,
        id: id,
        nome: nome,
        email: email,
        permissoes: permissoes,
        senha: senha,
        municipio: municipio,
      );

  Future<List<DeleteAllUsersRow>> deleteAllUsers() => performDeleteAllUsers(
        _database,
      );

  Future<List<QuerySelectUsuariosRow>> querySelectUsuarios() =>
      performQuerySelectUsuarios(
        _database,
      );

  Future<List<QueryLoginRow>> queryLogin({
    String? email,
    String? senha,
  }) =>
      performQueryLogin(
        _database,
        email: email,
        senha: senha,
      );

  Future<List<SelectByIDUsuariosRow>> selectByIDUsuarios({
    String? id,
  }) =>
      performSelectByIDUsuarios(
        _database,
        id: id,
      );

  Future<List<QueroInsertMunicipioRow>> queroInsertMunicipio({
    int? id,
    String? municipio,
    String? codIbge,
    String? status,
  }) =>
      performQueroInsertMunicipio(
        _database,
        id: id,
        municipio: municipio,
        codIbge: codIbge,
        status: status,
      );

  Future<List<QueroSelectMunicipioRow>> queroSelectMunicipio() =>
      performQueroSelectMunicipio(
        _database,
      );

  Future<List<SelectByNameMunicipioRow>> selectByNameMunicipio({
    String? nome,
  }) =>
      performSelectByNameMunicipio(
        _database,
        nome: nome,
      );

  Future<List<QueryDeleteAllMunicipioRow>> queryDeleteAllMunicipio() =>
      performQueryDeleteAllMunicipio(
        _database,
      );

  Future<List<CadastrarPontosRow>> cadastrarPontos({
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
  }) =>
      performCadastrarPontos(
        _database,
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
        idPMPlaca: idPMPlaca,
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
        sincronizado: sincronizado,
      );

  Future<List<DtDeleteItemRow>> dtDeleteItem({
    String? tabela,
    int? id,
  }) =>
      performDtDeleteItem(
        _database,
        tabela: tabela,
        id: id,
      );

  Future<List<BuscarPontosCadastradosRow>> buscarPontosCadastrados() =>
      performBuscarPontosCadastrados(
        _database,
      );

  Future<List<DeleteAllPontosRow>> deleteAllPontos() => performDeleteAllPontos(
        _database,
      );

  Future<List<SelecionarMunicipioAtualRow>> selecionarMunicipioAtual({
    String? nome,
  }) =>
      performSelecionarMunicipioAtual(
        _database,
        nome: nome,
      );

  Future<List<QuantidadeRegistroPontoRow>> quantidadeRegistroPonto() =>
      performQuantidadeRegistroPonto(
        _database,
      );

  Future<List<DeletePontoByIdRow>> deletePontoById({
    String? idd,
  }) =>
      performDeletePontoById(
        _database,
        idd: idd,
      );

  Future<List<BuscarPontosByIDRow>> buscarPontosByID({
    int? id,
  }) =>
      performBuscarPontosByID(
        _database,
        id: id,
      );

  Future<List<EditarPontoRow>> editarPonto({
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
  }) =>
      performEditarPonto(
        _database,
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
        idPMPlaca: idPMPlaca,
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
        updatedAT: updatedAT,
        sincronizado: sincronizado,
        id: id,
        fabricante: fabricante,
      );

  Future<List<SelectLaudoTecnicoRow>> selectLaudoTecnico() =>
      performSelectLaudoTecnico(
        _database,
      );

  Future<List<InsertLaudoTecnicoRow>> insertLaudoTecnico({
    String? nome,
  }) =>
      performInsertLaudoTecnico(
        _database,
        nome: nome,
      );

  Future<List<PontosNaorecenseadosRow>> pontosNaorecenseados() =>
      performPontosNaorecenseados(
        _database,
      );

  Future<List<PontosRecenseadosRow>> pontosRecenseados() =>
      performPontosRecenseados(
        _database,
      );

  Future<List<MarcarComoDeletadoRow>> marcarComoDeletado({
    String? idPonto,
    String? data,
  }) =>
      performMarcarComoDeletado(
        _database,
        idPonto: idPonto,
        data: data,
      );

  Future<List<SelectMunicipioByCodeRow>> selectMunicipioByCode({
    int? codigo,
  }) =>
      performSelectMunicipioByCode(
        _database,
        codigo: codigo,
      );

  Future<List<PontosConcluidoRow>> pontosConcluido() => performPontosConcluido(
        _database,
      );

  Future<List<PontoNaoConcluidoRow>> pontoNaoConcluido() =>
      performPontoNaoConcluido(
        _database,
      );

  Future<List<PontosPendentesRow>> pontosPendentes() => performPontosPendentes(
        _database,
      );

  Future<List<RotasRow>> rotas() => performRotas(
        _database,
      );

  Future<List<TodosPontosRecenseadosRow>> todosPontosRecenseados({
    List<String>? idsList,
  }) =>
      performTodosPontosRecenseados(
        _database,
        idsList: idsList,
      );

  Future<List<ListaDeRotasRow>> listaDeRotas() => performListaDeRotas(
        _database,
      );

  Future<List<TodosOsPontosRecenseadoRow>> todosOsPontosRecenseado({
    String? idsSql,
  }) =>
      performTodosOsPontosRecenseado(
        _database,
        idsSql: idsSql,
      );

  Future<List<SelecionarTodasLuminariasRow>> selecionarTodasLuminarias() =>
      performSelecionarTodasLuminarias(
        _database,
      );

  Future<List<SelecionarLuminariasByIdRow>> selecionarLuminariasById({
    int? id,
  }) =>
      performSelecionarLuminariasById(
        _database,
        id: id,
      );

  Future<List<CountLuminariasRow>> countLuminarias({
    int? id,
  }) =>
      performCountLuminarias(
        _database,
        id: id,
      );

  Future<List<SelecionarPontosByidPontoRow>> selecionarPontosByidPonto({
    String? idPonto,
  }) =>
      performSelecionarPontosByidPonto(
        _database,
        idPonto: idPonto,
      );

  Future<List<ContadorLuminariaRow>> contadorLuminaria({
    String? idPonto,
  }) =>
      performContadorLuminaria(
        _database,
        idPonto: idPonto,
      );

  Future<List<ContarPontosDaRotaRow>> contarPontosDaRota({
    String? ids,
  }) =>
      performContarPontosDaRota(
        _database,
        ids: ids,
      );

  Future<List<TotalPendentesDaRotaRow>> totalPendentesDaRota({
    String? ids,
  }) =>
      performTotalPendentesDaRota(
        _database,
        ids: ids,
      );

  Future<List<SelectManutencaoRow>> selectManutencao() =>
      performSelectManutencao(
        _database,
      );

  Future<List<InsertManutencaoRow>> insertManutencao({
    String? nome,
  }) =>
      performInsertManutencao(
        _database,
        nome: nome,
      );

  Future<List<SelectTipoPosteRow>> selectTipoPoste() => performSelectTipoPoste(
        _database,
      );

  Future<List<SelectAlturaPosteRow>> selectAlturaPoste() =>
      performSelectAlturaPoste(
        _database,
      );

  Future<List<SelectTamanhoBracoRow>> selectTamanhoBraco() =>
      performSelectTamanhoBraco(
        _database,
      );

  Future<List<TotalrecenseadoshojeRow>> totalrecenseadoshoje({
    int? idUser,
  }) =>
      performTotalrecenseadoshoje(
        _database,
        idUser: idUser,
      );

  Future<List<DeleteLuminariaRow>> deleteLuminaria({
    int? id,
    String? data,
  }) =>
      performDeleteLuminaria(
        _database,
        id: id,
        data: data,
      );

  Future<List<SelecionarPontosComCodMunicipioZeroRow>>
      selecionarPontosComCodMunicipioZero() =>
          performSelecionarPontosComCodMunicipioZero(
            _database,
          );

  Future<List<CorrigirCodigoMunicipioRow>> corrigirCodigoMunicipio({
    int? id,
  }) =>
      performCorrigirCodigoMunicipio(
        _database,
        id: id,
      );

  Future<List<SelecionarSolicitacoesRow>> selecionarSolicitacoes() =>
      performSelecionarSolicitacoes(
        _database,
      );

  Future<List<UpdateSolicitacoesRow>> updateSolicitacoes({
    int? id,
  }) =>
      performUpdateSolicitacoes(
        _database,
        id: id,
      );

  Future<List<VerificarSincronizaoRow>> verificarSincronizao({
    int? id,
  }) =>
      performVerificarSincronizao(
        _database,
        id: id,
      );

  Future<List<QuantidadePontosParaSincronarRow>>
      quantidadePontosParaSincronar() => performQuantidadePontosParaSincronar(
            _database,
          );

  Future<List<ContarPontosDaFilaRow>> contarPontosDaFila() =>
      performContarPontosDaFila(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  /// END UPDATE QUERY CALLS
}
