// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ListViewPostes extends StatefulWidget {
  final double height;
  final double width;

  const ListViewPostes({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _ListViewPostesState createState() => _ListViewPostesState(); // CORRETO!
}

class _ListViewPostesState extends State<ListViewPostes> {
  List<Map<String, dynamic>> _postes = [];
  final ScrollController _scrollController = ScrollController();
  int _offset = 0;
  final int _limit = 20;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _carregarMais();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !_isLoading &&
          _hasMore) {
        _carregarMais();
      }
    });
  }

  Future<void> _carregarMais() async {
    setState(() {
      _isLoading = true;
    });

    final novos = await buscarRegistrosPaginados(_offset, _limit);

    setState(() {
      _postes.addAll(List<Map<String, dynamic>>.from(novos));
      _offset += _limit;
      _isLoading = false;
      if (novos.length < _limit) {
        _hasMore = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildItem(BuildContext context, Map<String, dynamic> p) {
    return ListTile(
      title: Text(p['endereco'] ?? 'Sem endereço'),
      subtitle: Text(
        'Bairro: ${p['bairro'] ?? ''} | Potência: ${p['potencia'] ?? '0'}',
      ),
      trailing: Text(p['idd']?.toString() ?? ''),
      onTap: () async {
        final ponto = await buscarPontoPorId(p['id']);

        if (ponto.isNotEmpty) {
          FFAppState().ponto = StPontoCadastroStruct.fromMap(ponto.first);
        }

        context.pushNamed(
          'paginaEdicao',
          queryParameters: {
            'id': serializeParam(
              p['id'],
              ParamType.int,
            ),
            'idd': serializeParam(
              p['idd'],
              ParamType.String,
            ),
          }.withoutNulls,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_postes.isEmpty && _isLoading) {
      return const Center(child: CircularProgressIndicator()); // Loader inicial
    }

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _postes.length + (_hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < _postes.length) {
            return _buildItem(context, _postes[index]);
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
