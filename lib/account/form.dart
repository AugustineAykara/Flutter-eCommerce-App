import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import '../screens/homePage.dart';
import '../sizeconfig.dart';
import 'login.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocus = FocusNode();

  final FirebaseAuth auth = FirebaseAuth.instance;

  userLogin() async {
    FirebaseUser user;
    try {
      user = (await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;
    } on PlatformException catch (e) {
      if (e.toString().contains('ERROR_USER_NOT_FOUND')) {
        alertBox("there is no user corresponding to the given email address");
      } else if (e.toString().contains('ERROR_WRONG_PASSWORD')) {
        alertBox("Wrong Password");
      } else if (e.toString().contains('ERROR_INVALID_EMAIL')) {
        alertBox("Invalid email address");
      }
    } catch (e) {
      alertBox(e.toString());
    } finally {
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      }
    }
  }

  validLogin() {
    if (emailController.text == '' || passwordController.text == '') {
      alertBox("please fill the input field");
    } else {
      userLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: SizeConfig.blockSizeVertical * 5,),
            Image.asset(
              'assets/logo/signup.png',
              height: SizeConfig.blockSizeVertical * 35,
            ),
            
                Text(
                  "Hey,",
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeVertical * 4,
                    fontWeight: FontWeight.bold,
                    //fontFamily: "Poppins",
                    //color: Colors.red,
                  ),
                ),
             
            
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeVertical * 4,
                    //fontWeight: FontWeight.bold,
                    //fontFamily: "Poppins",
                    //color: Colors.red,
                  ),
                ),
              
            SizedBox(height: SizeConfig.blockSizeVertical * 4),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                   margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: <Widget>[
                      
                      Container(
                        height: SizeConfig.blockSizeVertical * 8,
                        child: TextFormField(
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: textInputDecoration('Enter your email ID'),
                          onFieldSubmitted: (String value) {
                            FocusScope.of(context).requestFocus(passwordFocus);
                          },
                        ),
                      ),
                      SizedBox(height: 14),
                      Container(
                        height: SizeConfig.blockSizeVertical * 8,
                        child: TextFormField(
                          focusNode: passwordFocus,
                          controller: passwordController,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          
                          decoration: textInputDecoration('Enter your password'),
                        ),
                      ),
                      SizedBox(height:SizeConfig.blockSizeVertical * 3,),
                      RaisedButton(
                        //elevation: 8,
                        textColor: Colors.white,
                        color: Colors.red,
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
                            //side: BorderSide(color: Colors.yellowAccent)
                            ),
                        onPressed: () {
                          validLogin();
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

  final FirebaseAuth auth = FirebaseAuth.instance;

  registerUserData() async {
    FirebaseUser user;
    try {
      user = (await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;
      Firestore.instance
          .collection('users')
          .document(emailController.text)
          .setData({
        'name': nameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    } on PlatformException catch (e) {
      if (e.toString().contains('ERROR_WEAK_PASSWORD')) {
        alertBox("password is not strong enough");
      } else if (e.toString().contains('ERROR_INVALID_EMAIL')) {
        alertBox('Invalid email');
      } else if (e.toString().contains('ERROR_EMAIL_ALREADY_IN_USE')) {
        alertBox(" email is already in use by a different account");
      }
    } catch (e) {
      alertBox(e.toString());
    } finally {
      if (user != null) {
        alertBox("Registered successfully");
      }
    }
  }

  inputValidationAndRegisterData() {
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
                inputValidationAndRegisterData();
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
