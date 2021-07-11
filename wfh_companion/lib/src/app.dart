import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wfh_companion/src/screens/home.dart';
import 'package:wfh_companion/src/screens/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WHF-Companion',
      //Common Theme 
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.yellow[500],  
        accentColor: Colors.black26, 
        buttonColor: Colors.yellow[800],
        dividerColor: Colors.yellow[600],
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 20),
          headline6: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),
          bodyText2:TextStyle(fontSize:20.0) )
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? LoginScreen()
          : HomeScreen(),
    );
  }
}
