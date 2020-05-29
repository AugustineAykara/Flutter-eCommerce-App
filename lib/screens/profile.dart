import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../sizeconfig.dart';
import 'cart/cart.dart';
import './myOrder/myOrders.dart';
import '../account/login.dart' ;

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

  userLogout() async {
    await auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Profile",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          fontSize: height / 30,
                          color: Colors.white),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Cart(),
                          ),
                        );
                      },
                    )
                  ],
                ),
                
              ],
            ),
          ),
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
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.05), blurRadius: 19)
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
                   
                    FlatButton(    
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Order(useremail: useremailid),
                          ),
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My Order",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 8,
                      color: Colors.grey,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My Address",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 8,
                      color: Colors.grey,
                    ),
                    FlatButton(
                      onPressed: () {
                        userLogout();
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "LOGOUT",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'poppins', color: Colors.redAccent),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 8,
                      color: Colors.grey,
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
