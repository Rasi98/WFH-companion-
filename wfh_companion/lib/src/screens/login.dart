import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wfh_companion/src/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
              color: Colors.yellow,
              height: 10,
              thickness: 10,
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.yellow.shade600,
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
                  color: Colors.yellow,
                  size: 50,
                ),
                Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            //Email
            Container(
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Email", border: InputBorder.none),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.yellow, width: 5.0),
                  borderRadius: BorderRadius.circular(10.0)),
              height: MediaQuery.of(context).size.height * .08,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
            SizedBox(
              height: 10,
            ),
            //password
            Container(
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Password", border: InputBorder.none),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.yellow, width: 5.0),
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
                  color: Colors.yellow,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () async {
                    try {
                      UserCredential result =
                          await auth.signInWithEmailAndPassword(
                              email: _email, password: _password);
                      User userOB = result.user;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    } on FirebaseAuthException catch (err) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
