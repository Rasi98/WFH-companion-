import 'dart:math';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wfh_companion/src/component/card_component.dart';
import 'package:wfh_companion/src/screens/login.dart';

class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .04),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .12,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * .1),
                  Container(
                    //home image
                    width: MediaQuery.of(context).size.width * .16,
                    height: MediaQuery.of(context).size.height * .1,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage('assets/homeLogo.png'))),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .15),
                  Text(
                    'John Moors',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Image.asset('assets/d.png'),
                    iconSize: 55,
                    onPressed: () {
                      auth.signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                  )
                ],
              )
            ],
          ),
        ), //end of cunsom app bar
        SizedBox(
          height: MediaQuery.of(context).size.height * .06,
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .15,
            ),
            MainMenuCard(asset: "assets/1.png",text: "Notification",),
            SizedBox(
              width: MediaQuery.of(context).size.width * .1,
            ),
            MainMenuCard(asset: "assets/5.png",text: "Fitness",)
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        // Row(
        //   children: [
        //     SizedBox(
        //       width: MediaQuery.of(context).size.width * .15,
        //     ),
        //     MainMenuCard(),
        //     SizedBox(
        //       width: MediaQuery.of(context).size.width * .1,
        //     ),
        //     MainMenuCard()
        //   ],
        // ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        // Row(
        //   children: [
        //     SizedBox(
        //       width: MediaQuery.of(context).size.width * .15,
        //     ),
        //     MainMenuCard(),
        //     SizedBox(
        //       width: MediaQuery.of(context).size.width * .1,
        //     ),
        //     MainMenuCard()
        //   ],
        // ),
      ],
    ));
  }
}
