import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  String _dropdownValue = 'Selecione';
  String _userText;
  String _textConverted;
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
            key: _formKey,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                          value: _dropdownValue,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          onChanged: (String newValue) {
                            setState(() {
                              _dropdownValue = newValue;
                            });
                          },
                          items: <String>[
                            'Selecione',
                            'Reverso',
                            'MAÍUSCULAS',
                            'minúsculas',
                            'aLtErNaDo'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            print('Validado');
                            print('_dropdownValue: $_dropdownValue');
                            print('_userText: $_userText');


                          }
                        },
                        child: const Text(
                          'Converter',
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    labelText: 'Resultado',
                  ),
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
