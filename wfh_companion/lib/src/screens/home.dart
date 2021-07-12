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
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .04),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .12,
            decoration: BoxDecoration(
              color: Color.fromRGBO(159, 148, 6, 1),
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
            height: MediaQuery.of(context).size.height * .09,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .15,
              ),
              MainMenuCard(
                asset: "assets/notification.png",
                text: "Notification",
                onClick: () {},
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .1,
              ),
              MainMenuCard(
                  asset: "assets/fitness.png", text: "Fitness", onClick: () {})
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .15,
              ),
              MainMenuCard(
                  asset: "assets/time.png",
                  text: "Check In/Out",
                  onClick: () {}),
              SizedBox(
                width: MediaQuery.of(context).size.width * .1,
              ),
              MainMenuCard(
                  asset: "assets/track.png", text: "Tracking", onClick: () {})
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .15,
              ),
              MainMenuCard(
                  asset: "assets/message.png", text: "Message", onClick: () {}),
              SizedBox(
                width: MediaQuery.of(context).size.width * .1,
              ),
              MainMenuCard(
                  asset: "assets/settings.png",
                  text: "Settings",
                  onClick: () {})
            ],
          ),
        ],
      ),
    ));
  }
}
