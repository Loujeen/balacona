import 'package:flutter/material.dart';
import 'package:testttt/Register/registerScreen.dart';

import 'App_Colors.dart';
import 'Home_Screen/Home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),

      },

    );  }
}
