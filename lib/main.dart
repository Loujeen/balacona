import 'package:flutter/material.dart';
import 'package:testttt/Register/registerScreen.dart';
import 'App_Colors.dart';
import 'Home_Screen/Home_Screen.dart';
import 'Home_Screen/know_about_plants_screen.dart';
import 'LoginSignup.dart';
import 'Profile/edit_information.dart';
import 'search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      initialRoute: KnowAboutPlantsScreen.routeName,
      routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginSignup.routeName: (context) => LoginSignup(),
        EditInformationScreen.routeName: (context) => EditInformationScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        KnowAboutPlantsScreen.routeName: (context) => KnowAboutPlantsScreen(),
      },

    );  }
}
