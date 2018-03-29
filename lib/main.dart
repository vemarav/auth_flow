import 'package:flutter/material.dart';

void main() => runApp(new AuthFlow());

class AuthFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold()
    );
  }
}