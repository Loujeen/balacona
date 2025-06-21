import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../App_Colors.dart';
import '../determine_position.dart';
import '../firebase_utils.dart';
import '../model/my_user.dart';
import '../providers/auth_user_provider.dart';
import '../dialog_utils.dart';
import '../Home_Screen/Home_Screen.dart';
import '../weather_service.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});
  static const String routeName = 'LocationScreen';

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late String name, email, password;
  Position? userPosition;
  String selectedLocationName = '';
  String currentWeather = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    if (args != null) {
      name = args['name']!;
      email = args['email']!;
      password = args['password']!;
    }
  }

  void register(BuildContext context) async {
    if (userPosition == null) {
      DialogUtils.showMessage(
        context: context,
        title: "Location Required",
        content: "Please select your current location before signing up.",
        posActionName: "OK",
      );
      return;
    }

    DialogUtils.showLoading(context: context, message: "Registering...");

    try {
      final cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      MyUser myUser = MyUser(
        id: cred.user?.uid ?? '',
        name: name,
        email: email,
      );

      Provider.of<AuthUserProvider>(context, listen: false)
          .updateUser(myUser);
      await FirebaseUtils.addUserToFireStore(myUser);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_location', selectedLocationName);
      await prefs.setString('user_weather', currentWeather);



      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
        context: context,
        content: "Registered successfully.",
        title: "Success",
        posActionName: "Go to Home",
        posAction: () {
          Navigator.of(context).pushReplacementNamed(
            HomeScreen.routeName,
            arguments: {
              'location': selectedLocationName,
              'weather': currentWeather,
            },
          );
        },
      );
    } catch (e) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
        context: context,
        content: e.toString(),
        title: "Error",
        posActionName: "OK",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/edit_info_bg.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: BackButton(color: AppColors.primaryDarkColor),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  'Your Location',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'To give you correct care instructions,\nwe need to know your location',
                  style: TextStyle(fontSize: 20, color: AppColors.primaryDarkColor),
                  textAlign: TextAlign.center,
                ),
                Expanded(child: SizedBox()),
                Center(
                  child: Image.asset(
                    'assets/images/loc_logo.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                Expanded(child: SizedBox()),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDarkColor,
                    minimumSize: Size(double.infinity, 60),
                  ),
                  onPressed: () async {
                    try {
                      Position pos = await determinePosition();
                      double lat = pos.latitude, lon = pos.longitude;

                      List<Placemark> places =
                      await placemarkFromCoordinates(lat, lon);
                      String locName =
                          places.first.locality ?? places.first.country ?? '';

                      String weather = await WeatherService()
                          .getCurrentTemperature(lat, lon);

                      setState(() {
                        userPosition = pos;
                        selectedLocationName = locName;
                        currentWeather = weather;
                      });

                      DialogUtils.showMessage(
                        context: context,
                        title: "Location & Weather",
                        content: "$locName\n$weather",
                        posActionName: "OK",
                      );
                    } catch (e) {
                      DialogUtils.showMessage(
                        context: context,
                        title: "Error",
                        content: e.toString(),
                        posActionName: "OK",
                      );
                    }
                  },
                  child: Text(
                    'Use Current Location',
                    style:
                    TextStyle(fontSize: 18, color: AppColors.primaryLightColor),
                  ),
                ),

                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(

                    backgroundColor: AppColors.primaryDarkColor,
                    minimumSize: Size(double.infinity, 60),
                  ),
                  onPressed: () => register(context),
                  child: Text(
                    'Sign Up',
                    style:
                    TextStyle(fontSize: 18, color: AppColors.primaryLightColor),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
