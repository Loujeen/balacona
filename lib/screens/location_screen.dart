// lib/screens/location_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../App_Colors.dart';
import '../Profile/textData.dart';
import '../widgets/back_button_circle.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});
  static const String routeName = 'LocationScreen';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child:
          Image.asset(
        "assets/images/edit_info_bg.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill
    ),
        ),
        Scaffold(
        backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            // title: TextProfileData(text: "Balacona", textColor: AppColors.primaryDarkColor, fontSize: 22, fontWeight: FontWeight.w700),
            // centerTitle: true,
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.primaryDarkColor,
                )),
          ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.03),
              Text(
                'Your location',
                style: TextStyle(
                  fontSize: 35,
                  letterSpacing: 1.7,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01),
              Text(
                'To give you correct care instructions,\nwe need to know your location',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.1),
              Center(
                child: Container(
                  child: Image.asset(
                    'assets/images/loc_logo.png',
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryDarkColor,
                  minimumSize: Size(double.infinity, 66),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // TODO: Add location logic
                },
                child: Text(
                  'Add location',
                  style: TextStyle(fontSize: 21, color: AppColors.primaryLightColor),
                ),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height*0.02),
              // OutlinedButton(
              //   style: OutlinedButton.styleFrom(
              //     side: BorderSide(color: AppColors.primaryDarkColor),
              //     minimumSize: Size(double.infinity,66),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   ),
              //   onPressed: () {
              //
              //   },
              //   child: Text(
              //     'Skip',
              //     style: TextStyle(fontSize: 21, color: AppColors.primaryDarkColor),
              //   ),
              // ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03),
            ],
          ),
        ),
      ),
    ]
    );
  }
}
