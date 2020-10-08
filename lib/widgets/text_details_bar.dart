import 'package:flutter/material.dart';

class TextDetailsBar extends StatefulWidget {
  final String userText;
  TextDetailsBar(this.userText);
  @override
  _TextDetailsBarState createState() => _TextDetailsBarState();
}

class _TextDetailsBarState extends State<TextDetailsBar> {
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
                  Text('3'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text('Palavras'),
                  Text('3'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(widget.userText.toString()),
                  Text('3'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
