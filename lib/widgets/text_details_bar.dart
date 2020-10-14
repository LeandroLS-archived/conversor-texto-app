import 'package:flutter/material.dart';
import 'dart:convert';

class TextDetailsBar extends StatelessWidget {
  final String userText;
  TextDetailsBar(this.userText);
  String get qtdCaracters {
    if (this.userText != null && this.userText.isNotEmpty) {
      return this.userText.length.toString();
    }
    return '0';
  }

  String get qtdPalavras {
    if (this.userText != null && this.userText.isNotEmpty) {
      var inputList = this
          .userText
          .split(' ')
          .join(', ')
          .split('\n')
          .join(', ')
          .split(', ');
      var inputListCleaned = inputList
          .where((word) => word.length >= 1 && word != '' && word != ' ');
      return inputListCleaned.length.toString();
    }
    return '0';
  }

  String get qtdLinhas {
    if (this.userText != null && this.userText.isNotEmpty) {
      LineSplitter ls = new LineSplitter();
      List<String> lines = ls.convert(this.userText);
      return lines.length.toString();
    }
    return '0';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      margin: EdgeInsets.only(bottom: 10),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Caracteres',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(qtdCaracters, style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Palavras',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(qtdPalavras, style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Linhas',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    qtdLinhas,
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
