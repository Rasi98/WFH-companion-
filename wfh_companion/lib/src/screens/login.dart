import 'dart:developer';
import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wfh_companion/src/screens/home.dart';
import 'package:wfh_companion/src/component/button_component.dart';
import 'package:wfh_companion/src/component/textfield_component.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "", _password = "";
  final auth = FirebaseAuth.instance;
  bool validated = false;
  bool invalidDetails = false;
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();

  //form field validate
  bool validate() {
    if (EmailValidator.validate(_email) && !_password.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //image
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage('assets/img-1.png'))),
            ),
            //diveder
            Divider(
              height: 10,
              thickness: 10,
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 10,
              thickness: 20,
            ),
            SizedBox(
              height: 15,
            ),
            //login icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_pin,
                  color: Theme.of(context).primaryColor,
                  size: 50,
                ),
                Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 50,
              child: Text(
                invalidDetails ? "Invalid Login Details.." : "",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),

            //TextField component email
            TextFieldV1(
              fieldcolor: Colors.white,
              padding: 10,
              bordercolor: Theme.of(context).primaryColor,
              borderwidth: 2.0,
              borderradius: 10.0,
              controler: emailCon,
              height: .08,
              width: 0.9,
              obsecure: false,
              keyboardtype: TextInputType.emailAddress,
              textcolor: Colors.black,
              hint: "Email",
              hintcolor: Colors.black,
              onchange: (value) {
                setState(() {
                  _email = value.trim();
                  validated = validate();
                });
              },
            ),

            SizedBox(
              height: 20,
            ),

            //TextField component password
            TextFieldV1(
              fieldcolor: Colors.white,
              padding: 10,
              bordercolor: Theme.of(context).primaryColor,
              borderwidth: 2.0,
              borderradius: 10.0,
              controler: passwordCon,
              height: .08,
              obsecure: true,
              width: 0.9,
              keyboardtype: TextInputType.emailAddress,
              textcolor: Colors.black,
              hint: "Password",
              hintcolor: Colors.black,
              onchange: (value) {
                setState(() {
                  _password = value.trim();
                  validated = validate();
                });
              },
            ),

            SizedBox(
              height: 20,
            ),

            // LargeCurveButton(
            //   text: "LOGIN",
            //   height: .07,
            //   width: 0.5,
            //   textcolor: Theme.of(context).textTheme.headline6,
            //   color: Theme.of(context).buttonColor,
            //   borderadius: 30,
            //   onClick: () {},
            // ),

            //login button
            ButtonTheme(
              height: MediaQuery.of(context).size.height * .07,
              minWidth: MediaQuery.of(context).size.width * .4,
              child: FlatButton(
                  disabledColor: Theme.of(context).accentColor,
                  color: Theme.of(context).buttonColor,
                  child: Text(
                    "LOGIN",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: validated
                      ? () async {
                          print(validated);
                          try {
                            UserCredential result =
                                await auth.signInWithEmailAndPassword(
                                    email: _email, password: _password);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          } on FirebaseAuthException catch (err) {
                            emailCon.clear();
                            passwordCon.clear();
                            setState(() {
                              _email = "";
                              _password = "";
                              invalidDetails = true;
                              validated = false;
                            });
                          }
                        }
                      : null),
            ),
          ],
        ),
      ),
    );
  }
}
