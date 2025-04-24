import 'package:flutter/material.dart';
import 'package:testttt/Profile/edit_information.dart';
import 'package:testttt/Register/registerScreen.dart';


import 'App_Colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      initialRoute: EditInformationScreen.routeName,
      routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
        EditInformationScreen.routeName: (context) => EditInformationScreen()

      },

    );  }
}
