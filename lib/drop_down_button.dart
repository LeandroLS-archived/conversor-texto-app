import 'package:flutter/material.dart';
import 'classes/HandleText.dart';

class DropDownButton extends StatefulWidget {
  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String _dropdownValue = 'Selecione';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration.collapsed(hintText: ''),
      validator: (value) => value == 'Selecione' ? 'Selecione um valor.' : null,
      value: _dropdownValue,
      onChanged: (String newValue) {
        setState(() {
          _dropdownValue = newValue;
        });
      },
      items: HandleText.opcoes.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
