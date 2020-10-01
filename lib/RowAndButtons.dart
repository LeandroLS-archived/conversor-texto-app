import 'package:flutter/material.dart';
import 'drop_down_button.dart';

class RowAndButtons extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  RowAndButtons(this.formKey);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(width: 125, child: DropDownButton()),
        Container(
          child: RaisedButton(
            onPressed: () {
              if (formKey.currentState.validate()) {
                
              }
            },
            child: const Text(
              'Converter',
            ),
          ),
        ),
      ],
    );
  }
}
