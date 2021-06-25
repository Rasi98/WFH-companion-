import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26,
        body: Column(
          children: [
            Container(
              child: Image(
                width: 1000,
                image: AssetImage("assets/img-1.png"),
              ),
            )
          ],
        ));
  }
}
