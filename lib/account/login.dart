import 'package:flutter/material.dart';
import 'form.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/homePage.dart';

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
  final FirebaseAuth auth = FirebaseAuth.instance;

  // @override
  // void initState() {
  //   super.initState();
  //   getUser().then((user) {
  //     if (user != null) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => Home(),
  //         ),
  //       );
  //     }
  //   });
  // }

  Future<FirebaseUser> getUser() async {
    return await auth.currentUser();
  }

  final pages = [
    Container(
      child: LoginForm(),
    ),
    Container(
      child: RegisterForm(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.yellow[100],
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Builder(
            builder: (context) => LiquidSwipe(
              pages: pages,
              enableSlideIcon: true,
              positionSlideIcon: .7,
              slideIconWidget: Wrap(
                spacing: -14,
                children: <Widget>[
                  Icon(Icons.arrow_back_ios, color: Colors.grey),
                  Icon(Icons.arrow_back_ios, color: Colors.grey[600])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
