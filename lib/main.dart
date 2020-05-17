import 'package:flutter/material.dart';
import 'package:pro/account/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

// class Main extends StatefulWidget {
//   @override
//   _MainState createState() => _MainState();
// }

// class _MainState extends State<Main> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//     );
//   }
// }

