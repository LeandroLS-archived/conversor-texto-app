import 'package:flutter/material.dart';

class TextDetailsBar extends StatefulWidget {
  @override
  _TextDetailsBarState createState() => _TextDetailsBarState();
}

class _TextDetailsBarState extends State<TextDetailsBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Column(
              children: <Widget>[
                Text('Caracteres'),
                Text('3'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Column(
              children: <Widget>[
                Text('Palavras'),
                Text('3'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Column(
              children: <Widget>[
                Text('Linhas'),
                Text('3'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}