import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
import 'providers/list_provider.dart';
import 'providers/auth_user_provider.dart';

import 'Register/registerScreen.dart';
import 'screens/GameScreen.dart';
import 'screens/community_screen.dart';
import 'screens/home_location_screen.dart';
import 'screens/location_screen.dart';
import 'screens/login_screen.dart';
import 'Home_Screen/Home_Screen.dart';
import 'Home_Screen/LearnAboutPlants.dart';
import 'Home_Screen/Popularplant.dart';
import 'Home_Screen/know_about_plants_screen.dart';
import 'LoginSignup.dart';
import 'Profile/edit_information.dart';
import 'Profile/profileScreen.dart';
import 'search_screen.dart';
import 'screens/add_plant/plant_list_tab.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListProvider()),
        ChangeNotifierProvider(create: (_) => AuthUserProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: LoginSignup.routeName,
            routes: {
              RegisterScreen.routeName: (context) => RegisterScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
              LoginSignup.routeName: (context) => LoginSignup(),
              EditInformationScreen.routeName: (context) => EditInformationScreen(),
              SearchScreen.routeName: (context) => SearchScreen(),
              KnowAboutPlantsScreen.routeName: (context) => KnowAboutPlantsScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              LocationScreen.routeName: (context) => LocationScreen(),
              HomeLocationScreen.routeName: (context) => HomeLocationScreen(),
              CommunityScreen.routeName: (context) => CommunityScreen(),
              ProfileScreen.routeName: (context) => ProfileScreen(),
              LearnAboutPlantScreen.routeName: (context) => LearnAboutPlantScreen(),
              PopularPlantScreen.routeName: (context) => PopularPlantScreen(),
              GameScreen.routeName: (context) => GameScreen(),
              TaskListTab.routeName: (context) => TaskListTab(),
            },
          );
        },
      ),
    );
  }
}
