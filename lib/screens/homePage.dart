import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'myHome.dart';
import 'offers.dart';
import 'profile.dart';
import '../account/login.dart';

class Home extends StatefulWidget {
  static String tag = 'home';

  @override
  State createState() => new HomeState();
}

class HomeState extends State<Home> {
  String username = '', useremailid = '';
  int _currentIndex = 0;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return MyHome();
      case 1:
        return Offers();
      case 2:
        return Profile();
      default:
        return MyHome();
    }
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
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Icon cusIcon = Icon(Icons.search, color: Colors.white);
  Widget cusSearchBar = Text(
    "Shop now",
    style: TextStyle(
      fontFamily: 'Calistoga',
      color: Colors.white,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,      
      body: Container(
        child: callPage(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              "Home",
              style: TextStyle(fontFamily: 'BreeSerif'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_offer,
            ),
            title: Text(
              "Offers",
              style: TextStyle(fontFamily: 'BreeSerif'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            title: Text(
              "Profile",
              style: TextStyle(fontFamily: 'BreeSerif'),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
