import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'account/login.dart';
import 'screens/homePage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => getUser().then((user) {
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        }
      }),
    );
  }

  getUser() {
    return  auth.currentUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Center(
           child: Image.asset(
             'assets/logo/logo.png',
              scale: 2.8,
           )
          )
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: <Widget>[
          //     Expanded(
          //         flex: 2,
          //         child: Container(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: <Widget>[
          //               CircleAvatar(
          //                   radius: 85, child: Image.asset('assets/logo/logo.png')),
          //             ],
          //           ),
          //         )),
          //   ],
          // ),
        ],
      ),
    );
  }
}
