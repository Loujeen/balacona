import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testttt/SplashScreen.dart';
import 'package:testttt/LoginSignup.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
        home: FirebaseAuth.instance.currentUser==null? SplashScreen():LoginSignup()
      );  }
}
