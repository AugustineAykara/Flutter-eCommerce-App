import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        hintColor: Colors.white,
        textTheme: new TextTheme(
          
          body1: new TextStyle(color: Colors.black),
        ),
        
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

