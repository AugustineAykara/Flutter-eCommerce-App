import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String username = '', useremailid = '', phone = '';

  getCurrentUser() async {
    final FirebaseUser user = await auth.currentUser();
    Firestore.instance
        .collection('users')
        .document(user.email)
        .get()
        .then((value) {
      setState(() {
        username = value.data['name'];
        useremailid = value.data['email'];
        phone = value.data['phone'].toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.fromLTRB(28, 37, 28, 28),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.2), blurRadius: 19)
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: 140,
                    ),
                    Text(
                      username,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      phone.toString(),
                    ),
                    Text(
                      useremailid,
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 38, left: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Divider(
                      thickness: 2,
                      height: 8,
                      color: Colors.black,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My Order",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      height: 8,
                      color: Colors.black,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My Address",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      height: 8,
                      color: Colors.black,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Logout",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      height: 8,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),

              // Column(
              //   children: <Widget>[
              //     Container(
              //       width: double.infinity,
              //       height: 1,
              //       color: Colors.black,
              //     ),
              //     Divider(
              //       thickness: 2,
              //       color: Colors.black,
              //     ),
              //   ],
              // ),
              // Column(
              //   children: <Widget>[
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: <Widget>[
              //         FlatButton(
              //           onPressed: () {},
              //           child: Text(
              //             "My Address",
              //             style: TextStyle(fontSize: 17),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // Column(
              //   children: <Widget>[
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: <Widget>[
              //         FlatButton(
              //           onPressed: () {},
              //           child: Text(
              //             "Logout",
              //             style: TextStyle(fontSize: 17),
              //           ),
              //         ),
              //       ],
              //     ),
              //     Container(
              //       width: double.infinity,
              //       height: 1,
              //       color: Colors.black,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 15,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
