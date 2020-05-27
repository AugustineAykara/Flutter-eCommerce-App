import 'package:flutter/material.dart';
import 'splash.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        textTheme: new TextTheme(
          bodyText1: new TextStyle(color: Colors.black),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}
