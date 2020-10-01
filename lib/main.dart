import 'package:conversor_texto_app/RowAndButtons.dart';
import 'package:flutter/material.dart';
import 'text_field_converted.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  final formKey = GlobalKey<FormState>();

  String _userText;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Conversor de Texto'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    hintText: 'Insira o texto aqui...',
                    labelText: 'Seu Texto',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor insira um texto.';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    this._userText = text;
                    print("First text field: $text");
                  },
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: RowAndButtons(formKey)
                ),
                TextFieldConverted()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
