import 'package:flutter/material.dart';

class TextFieldConverted extends StatefulWidget {
  @override
  _TextFieldConvertedState createState() => _TextFieldConvertedState();
}

class _TextFieldConvertedState extends State<TextFieldConverted> {
  final _myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      controller: _myController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        filled: true,
        labelText: 'Resultado',
      ),
    );
  }
}
