import 'package:flutter/material.dart';
import '../TextConverter.dart';

class TextAreas extends StatefulWidget {
  @override
  _TextAreasState createState() => _TextAreasState();
}

class _TextAreasState extends State<TextAreas> {
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

  convertText(String str) {
    switch (_dropdownValue) {
      case 'Reverso':
        return TextConverter.textReversed(str);
        break;
      case 'MAÍUSCULAS':
        return TextConverter.textToUpper(str);
        break;
      case 'minúsculas':
        return TextConverter.textToLower(str);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Card(
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 125,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration.collapsed(hintText: ''),
                        validator: (value) =>
                            value == 'Selecione' ? 'Selecione um valor.' : null,
                        value: _dropdownValue,
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
                    Container(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
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
              ),
            ],
          ),
        ),
        Card(
          child: TextFormField(
            maxLines: 5,
            controller: _myController,
            enabled: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              labelText: 'Resultado',
            ),
          ),
        ),
      ],
    );
  }
}
