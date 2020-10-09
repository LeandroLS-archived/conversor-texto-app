import 'package:flutter/material.dart';
import 'dart:convert';
class TextDetailsBar extends StatefulWidget {
  final String userText;
  TextDetailsBar(this.userText);
  @override
  _TextDetailsBarState createState() => _TextDetailsBarState();
}

class _TextDetailsBarState extends State<TextDetailsBar> {
  String get qtdCaracters {
    if(widget.userText != null && widget.userText.isNotEmpty){
      return widget.userText.length.toString();
    } 
    return '0';
    
  }

  String get qtdPalavras {
    if(widget.userText != null && widget.userText.isNotEmpty){
      var inputList = widget.userText.split(' ').join(', ').split('\n').join(', ').split(', ');
      var inputListCleaned = inputList.where((word) => word.length >= 1 && word != '' && word != ' ');
      return inputListCleaned.length.toString();
    }
    return '0';
  }
  String get qtdLinhas {
    if(widget.userText != null && widget.userText.isNotEmpty){
      LineSplitter ls = new LineSplitter();
      List<String> lines = ls.convert(widget.userText);
      return lines.length.toString();
    }
    return '0';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text('Caracteres'),
                  Text(qtdCaracters),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text('Palavras'),
                  Text(qtdPalavras),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text('Linhas'),
                  Text(qtdLinhas),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
