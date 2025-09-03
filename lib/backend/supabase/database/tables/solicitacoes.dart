import '../database.dart';

class SolicitacoesTable extends SupabaseTable<SolicitacoesRow> {
  @override
  String get tableName => 'solicitacoes';

  @override
  SolicitacoesRow createRow(Map<String, dynamic> data) => SolicitacoesRow(data);
}

class SolicitacoesRow extends SupabaseDataRow {
  SolicitacoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SolicitacoesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get tipo => getField<String>('tipo')!;
  set tipo(String value) => setField<String>('tipo', value);

  String? get prioridade => getField<String>('prioridade');
  set prioridade(String? value) => setField<String>('prioridade', value);

  int get referencia => getField<int>('referencia')!;
  set referencia(int value) => setField<int>('referencia', value);

  String? get observacoes => getField<String>('observacoes');
  set observacoes(String? value) => setField<String>('observacoes', value);

  DateTime get dataAbertura => getField<DateTime>('data_abertura')!;
  set dataAbertura(DateTime value) =>
      setField<DateTime>('data_abertura', value);

  DateTime? get dataConclusao => getField<DateTime>('data_conclusao');
  set dataConclusao(DateTime? value) =>
      setField<DateTime>('data_conclusao', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get municipioId => getField<int>('municipio_id');
  set municipioId(int? value) => setField<int>('municipio_id', value);

  int? get pontoId => getField<int>('ponto_id');
  set pontoId(int? value) => setField<int>('ponto_id', value);

  int? get responsavel => getField<int>('responsavel');
  set responsavel(int? value) => setField<int>('responsavel', value);
}
