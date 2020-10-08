import 'package:flutter/material.dart';
import '../TextConverter.dart';
import '../widgets/text_details_bar.dart';

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
              TextDetailsBar(this._userText),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
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
                     setState(() {
                        this._userText = text;
                      });
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
                      width: 140,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration.collapsed(hintText: ''),
                            validator: (value) => value == 'Selecione'
                                ? 'Selecione um valor.'
                                : null,
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
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: ButtonTheme(
                        // minWidth: 200.0,
                        height: 48.0,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: TextFormField(
            maxLines: 5,
            controller: _myController,
            enabled: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              filled: true,
              labelText: 'Resultado',
            ),
          ),
        ),
      ],
    );
  }
}
