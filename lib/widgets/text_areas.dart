import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/text_details_bar.dart';
import '../widgets/buttons.dart';

class TextAreas extends StatefulWidget {
  @override
  _TextAreasState createState() => _TextAreasState();
}

class _TextAreasState extends State<TextAreas> {
  final _formKey = GlobalKey<FormState>();
  void apagarTexto() {
    setState(() {
      userTextController.text = '';
      textConvertedController.text = '';
    });
  }

  final textConvertedController = TextEditingController();
  final userTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextDetailsBar(this.userTextController.text),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: userTextController,
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
                    setState(() {});
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Buttons(
                    formKey: _formKey,
                    textConvertedController: textConvertedController,
                    userTextController: userTextController,
                    apagarTextoHandler: apagarTexto),
              ),
            ],
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: TextFormField(
            maxLines: 5,
            controller: textConvertedController,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: ElevatedButton(
                onPressed: () {
                  if (this._formKey.currentState.validate()) {
                    Clipboard.setData(
                      ClipboardData(text: textConvertedController.text),
                    );
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Texto convertido copiado.'),
                    ));
                  }
                },
                child: Icon(
                  Icons.content_copy,
                  color: Colors.white,
                  size: 26,
                  semanticLabel: 'Copiar',
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
