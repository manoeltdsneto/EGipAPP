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

class CodeEditorWidget extends StatefulWidget {
  final double width; // Parâmetro obrigatório para largura
  final double height; // Parâmetro obrigatório para altura

  const CodeEditorWidget({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  _CodeEditorWidgetState createState() => _CodeEditorWidgetState();
}

class _CodeEditorWidgetState extends State<CodeEditorWidget> {
  TextEditingController _controller = TextEditingController();
  List<String> _lines = ['']; // Lista que simula as linhas de código

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  // Atualizar linhas conforme o texto é alterado
  void _onTextChanged() {
    setState(() {
      _lines =
          _controller.text.split('\n'); // Divide o texto por quebras de linha
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, // Aplicando o parâmetro width
      height: widget.height, // Aplicando o parâmetro height
      child: Row(
        children: [
          // Número das linhas
          Container(
            width: 50,
            color: Colors.grey[200],
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _lines.length,
              itemBuilder: (context, index) {
                return Text(
                  (index + 1).toString(),
                  style: TextStyle(fontFamily: 'monospace', fontSize: 16),
                );
              },
            ),
          ),
          // Caixa de Texto para o Código
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: TextField(
                controller: _controller,
                maxLines: null, // permite múltiplas linhas
                decoration: InputDecoration(border: InputBorder.none),
                style: TextStyle(fontFamily: 'monospace', fontSize: 16),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                focusNode: FocusNode(),
                onChanged: (text) {
                  _onTextChanged(); // Atualiza as linhas
                },
                onSubmitted: (text) {
                  _moveToNextLine(); // Adiciona uma nova linha ao pressionar Enter
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Mover para a próxima linha quando Enter for pressionado
  void _moveToNextLine() {
    setState(() {
      _lines.add(''); // Adiciona uma nova linha
      _controller.text += '\n'; // Adiciona um caractere de nova linha no texto
      _controller.selection = TextSelection.collapsed(
          offset: _controller.text.length); // Move o cursor para a nova linha
    });
  }
}
