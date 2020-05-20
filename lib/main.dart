import 'package:flutter/material.dart';
import 'flash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        hintColor: Colors.white,

        textTheme: new TextTheme(
          
          bodyText1: new TextStyle(color: Colors.black),
        ),
        //primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Flash(),
    );
  }
}


