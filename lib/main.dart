import 'package:flutter/material.dart';
import 'widgets/text_areas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.green,
      ),
      home: Scaffold(
<<<<<<< HEAD
        backgroundColor: const Color(0xffe1e4fa),
=======
        // backgroundColor: Colors.,
>>>>>>> 6d3fbdd1a3ffad847ce8e8edc3e2cce2cda9c832
        appBar: AppBar(
          title: Text('Conversor de Texto'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: TextAreas(),
        ),
      ),
    );
  }
}
