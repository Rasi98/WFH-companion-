import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wfh_companion/src/app.dart';
import 'package:wfh_companion/src/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}
