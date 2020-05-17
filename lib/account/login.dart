import 'package:flutter/material.dart';
import 'form.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Login extends StatelessWidget {
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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final pages = [
    Container(
      child: LoginForm(),
    ),
    Container(
      child: RegisterForm()
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],      
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Builder(
            builder: (context) => LiquidSwipe(
              pages: pages,
              enableSlideIcon: true,
              positionSlideIcon: .7,
            ),
          ),
        ),
      ),
    );
  }
}
