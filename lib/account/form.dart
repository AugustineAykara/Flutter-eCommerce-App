import 'package:flutter/material.dart';
import 'package:pro/account/login.dart';
import '../screens/home.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/logo/logo.png',
            scale: 1.4,
          ),
          Text(
            "ShopMate",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              color: Colors.orange[900],
            ),
          ),
          SizedBox(height: 22),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(28),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your e-mail ID',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    RaisedButton(
                      elevation: 8,
                      textColor: Colors.white,
                      color: Colors.yellow[800],
                      padding: EdgeInsets.fromLTRB(22, 10, 22, 10),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.yellowAccent)),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 28),
          Text(
            "No Account",
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            "Swipe left to Register",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              // fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: Container(
        margin: EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  'assets/logo/logo.png',
                  scale: 2.5,
                ),
                Text(
                  "ShopMate",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Montserrat',
                    color: Colors.deepOrange[900],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                labelText: 'Enter your Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(height: 14),
            TextFormField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                labelText: 'Enter your Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(height: 14),
            TextFormField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                labelText: 'Enter your e-mail ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(height: 14),
            TextFormField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(height: 14),
            TextFormField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            RaisedButton(
              elevation: 8,
              textColor: Colors.white,
              color: Colors.yellow[800],
              padding: EdgeInsets.fromLTRB(22, 10, 22, 10),
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.yellowAccent)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
            ),
            SizedBox(height: 30),
            Text(
              "Swipe left to Login",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
