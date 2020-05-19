import 'dart:async';
import 'package:flutter/material.dart';
import 'account/login.dart';

class Flash extends StatefulWidget {
  @override
  _FlashState createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage())),
    );
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
