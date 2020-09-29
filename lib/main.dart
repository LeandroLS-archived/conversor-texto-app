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
  static const List<String> opcoes = [
    'Selecione',
    'Reverso',
    'MAÍUSCULAS',
    'minúsculas',
  ];
  final _myController = TextEditingController();

  textToUpper(String str) {
    return str.toUpperCase();
  }

  textToLower(String str) {
    return str.toLowerCase();
  }

  textReversed(String str) {
    return str.split('').reversed.join();
  }

  convertText(String str) {
    switch (_dropdownValue) {
      case 'Reverso':
        return textReversed(str);
        break;
      case 'MAÍUSCULAS':
        return textToUpper(str);
        break;
      case 'minúsculas':
        return textToLower(str);
        break;
    }
  }

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
                    Container(
                      width: 135,
                      child: DropdownButtonFormField<String>(
                        validator: (value) => value == 'Selecione' ? 'Selecione um valor.' : null,
                        value: _dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        onChanged: (String newValue) {
                          setState(() {
                            _dropdownValue = newValue;
                          });
                        },
                        items: opcoes
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _myController.text = convertText(_userText);
                            });
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
                  maxLines: 5,
                  controller: _myController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    labelText: 'Resultado',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
