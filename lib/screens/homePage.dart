import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'myHome.dart';
import 'offers.dart';
import 'favourites.dart';
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
        return Favourites();
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
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text(username),
              accountEmail: Text(useremailid.toString()),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.blue[800]),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My order"),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.green,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Help & Feedback"),
                leading: Icon(
                  Icons.feedback,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.help,
                  color: Colors.lightBlue,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                userLogout();
              },
              child: ListTile(
                title: Text("log out"),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: callPage(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              "Home",
              //style: TextStyle(fontFamily: 'BreeSerif'),
            ),
            // backgroundColor: Colors.blue[800],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_offer,
            ),
            title: Text(
              "Offers",
              //style: TextStyle(fontFamily: 'BreeSerif'),
            ),
            // backgroundColor: Colors.blue[800],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text(
              "Favourite",
              //style: TextStyle(fontFamily: 'BreeSerif'),
            ),
            // backgroundColor: Colors.blue[800],
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
