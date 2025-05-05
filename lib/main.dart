import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testttt/Register/registerScreen.dart';
import 'package:testttt/screens/community_screen.dart';
import 'package:testttt/screens/home_location_screen.dart';
import 'package:testttt/screens/location_screen.dart';
import 'package:testttt/screens/login_screen.dart';
import 'App_Colors.dart';
import 'Home_Screen/Home_Screen.dart';
import 'Home_Screen/know_about_plants_screen.dart';
import 'LoginSignup.dart';
import 'Profile/edit_information.dart';
import 'search_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.routeName,
          routes: {
            RegisterScreen.routeName: (context) => RegisterScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            LoginSignup.routeName: (context) => LoginSignup(),
            EditInformationScreen.routeName: (context) =>
                EditInformationScreen(),
            SearchScreen.routeName: (context) => SearchScreen(),
            KnowAboutPlantsScreen.routeName: (context) =>
                KnowAboutPlantsScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            LocationScreen.routeName: (context) => LocationScreen(),
            HomeLocationScreen.routeName: (context) => HomeLocationScreen(),
            CommunityScreen.routeName: (context) => CommunityScreen(),
          },
        );
      },
    );
  }
}
