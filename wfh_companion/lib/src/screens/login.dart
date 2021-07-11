import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wfh_companion/src/screens/home.dart';

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
                  style:TextStyle(
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
            //Email
            Container(
              child: TextField(
                controller: emailCon,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Email",hintStyle: TextStyle(color: Colors.black),border: InputBorder.none),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                    validated = validate();
                  });
                },
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0)),
              height: MediaQuery.of(context).size.height * .08,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
            SizedBox(
              height: 20,
            ),
            //password
            Container(
              child: TextField(
                controller: passwordCon,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Password",hintStyle: TextStyle(color: Colors.black), border: InputBorder.none),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                    validated = validate();
                  });
                },
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0)),
              height: MediaQuery.of(context).size.height * .08,
              width: MediaQuery.of(context).size.width * 0.9,
            ),

            SizedBox(
              height: 20,
            ),
            //login button
            ButtonTheme(
              height: MediaQuery.of(context).size.height * .07,
              minWidth: MediaQuery.of(context).size.width * .4,
              child: FlatButton(
                  disabledColor: Theme.of(context).accentColor,
                  disabledTextColor: Colors.white,
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
