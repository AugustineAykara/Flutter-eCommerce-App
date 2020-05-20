import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import '../screens/homePage.dart';
import 'login.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/logo/logo01.png',
            scale: 1.8,
          ),
          Text(
            "ShopMate",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
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
                      textInputAction: TextInputAction.next,
                      decoration: textInputDecoration('Enter your email ID'),
                      onFieldSubmitted: (String value) {
                        FocusScope.of(context)
                            .requestFocus(passwordFocus);
                      },
                    ),
                    SizedBox(height: 14),
                    TextFormField(
                      focusNode: passwordFocus,
                      textInputAction: TextInputAction.done,
                      decoration: textInputDecoration('Enter your password'),
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
                        // checkValidUser();
                        // setSharedPref();

                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Home(),
                        //   ),
                        // );
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

  InputDecoration textInputDecoration(placeholder) {
    return InputDecoration(
      labelText: placeholder,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocus = FocusNode();

  registerUserData() {
    Firestore.instance
        .collection('users')
        .document(emailController.text)
        .setData({
      'name': nameController.text,
      'phone': phoneController.text,
      'email': emailController.text,
      'password': passwordController.text
    });
  }

  inputValidation() {
    if (nameController.text == '' ||
        phoneController.text == '' ||
        emailController.text == '' ||
        passwordController.text == '' ||
        confirmPasswordController.text == "") {
      alertBox("Please compete the form");
    } else if (passwordController.text != confirmPasswordController.text) {
      alertBox("Incorrect Password");
    } else {
      registerUserData();
      alertBox("Registered successfully");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    }
  }

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
                  'assets/logo/logo01.png',
                  scale: 2.7,
                ),
                Text(
                  "ShopMate",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepOrange[900],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: nameController,
              decoration: textInputDecoration("Name"),
            ),
            SizedBox(height: 14),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: textInputDecoration("Phone Number"),
            ),
            SizedBox(height: 14),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: textInputDecoration("email ID"),
            ),
            SizedBox(height: 14),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              textInputAction: TextInputAction.next,
              decoration: textInputDecoration("Password"),
              onFieldSubmitted: (String value) {
                FocusScope.of(context).requestFocus(confirmPasswordFocus);
              },
            ),
            SizedBox(height: 14),
            TextFormField(
              focusNode: confirmPasswordFocus,
              controller: confirmPasswordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: textInputDecoration("Confirm Password"),
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
                inputValidation();
                // registerUserData();
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Login(),
                //   ),
                // );
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

  void alertBox(message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(message),
          actions: [
            FlatButton(
              child: Text("Done"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  InputDecoration textInputDecoration(placeholder) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      labelText: placeholder,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
  }
}
