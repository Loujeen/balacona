import 'package:flutter/material.dart';
import 'package:testttt/App_Colors.dart';
import 'package:testttt/Profile/language_bottom_sheet.dart';
import 'package:testttt/Profile/textData.dart';
import 'package:testttt/Profile/theme_bottom_sheet.dart';
import 'edit_information.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = 'Profile_Screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showNotification = false;
  bool sound = false;
  bool wateringAlert = false;
  bool weatherAlert = false;

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
            title: TextProfileData(text: "Profile", textColor: AppColors.primaryDarkColor, fontSize: 22, fontWeight: FontWeight.w700),
            centerTitle: true,
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.primaryDarkColor,
                )),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/profilePIC.png"
                        ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextProfileData(text: "Karima Mousa", textColor: AppColors.blackColor, fontSize: 20, fontWeight: FontWeight.w500),
                          TextProfileData(text: "karima@example.com", textColor: AppColors.DarkGreyColor, fontSize: 20, fontWeight: FontWeight.w500),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03),
                  TextProfileData(text: "General", textColor: AppColors.primaryDarkColor, fontSize: 20, fontWeight: FontWeight.w900),
                  Divider(
                    thickness: 2,
                    color: AppColors.primaryDarkColor,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(EditInformationScreen.routeName);
                    },
                    child: Text(
                      "Edit Information",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  // TextProfileData(text: "Edit Information", textColor: AppColors.blackColor, fontSize: 20, fontWeight: FontWeight.w500),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01),
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(context: context, builder: (context) {
                        return LanguageBottomSheet();
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextProfileData(text: "Language", textColor: AppColors.blackColor, fontSize: 20, fontWeight: FontWeight.w500),
                        IconButton(
                            onPressed: (){
                              showModalBottomSheet(context: context, builder: (context) {
                                return LanguageBottomSheet();
                              });
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.primaryDarkColor,
                              size: 35,
                            )
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height*0.01),
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(context: context, builder: (context) {
                        return ThemeBottomSheet();
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextProfileData(text: "Theme", textColor: AppColors.blackColor, fontSize: 20, fontWeight: FontWeight.w500),
                        IconButton(
                            onPressed: (){
                              showModalBottomSheet(context: context, builder: (context) {
                                return ThemeBottomSheet();
                              });
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.primaryDarkColor,
                              size: 35,
                            )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  TextProfileData(text: "Notification", textColor: AppColors.primaryDarkColor, fontSize: 20, fontWeight: FontWeight.w900),
                  Divider(
                    thickness: 2,
                    color: AppColors.primaryDarkColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextProfileData(text: "Show Notification", textColor: AppColors.blackColor, fontSize: 20, fontWeight: FontWeight.w500),
                      Switch(
                          activeColor: AppColors.primaryLightColor,
                          activeTrackColor: AppColors.primaryDarkColor,
                          inactiveThumbColor: AppColors.primaryLightColor,
                          inactiveTrackColor: AppColors.DarkGreyColor,
                          value: showNotification,
                          onChanged: (value) {
                            setState(() {
                              showNotification = value;
                            });
                          }
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextProfileData(text: "Sound", textColor: AppColors.blackColor, fontSize: 20, fontWeight: FontWeight.w500),
                      Switch(
                          activeColor: AppColors.primaryLightColor,
                          activeTrackColor: AppColors.primaryDarkColor,
                          inactiveThumbColor: AppColors.primaryLightColor,
                          inactiveTrackColor: AppColors.DarkGreyColor,
                          value: sound,
                          onChanged: (value) {
                            setState(() {
                              sound = value;
                            });
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  TextProfileData(text: "Alerts", textColor: AppColors.primaryDarkColor, fontSize: 20, fontWeight: FontWeight.w900),
                  Divider(
                    thickness: 2,
                    color: AppColors.primaryDarkColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextProfileData(text: "Watering Alert", textColor: AppColors.blackColor, fontSize: 20, fontWeight: FontWeight.w500),
                      Switch(
                          activeColor: AppColors.primaryLightColor,
                          activeTrackColor: AppColors.primaryDarkColor,
                          inactiveThumbColor: AppColors.primaryLightColor,
                          inactiveTrackColor: AppColors.DarkGreyColor,
                          value: wateringAlert,
                          onChanged: (value) {
                            setState(() {
                              wateringAlert = value;
                            });
                          }
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextProfileData(text: "Weather Alert", textColor: AppColors.blackColor, fontSize: 20, fontWeight: FontWeight.w500),
                      Switch(
                          activeColor: AppColors.primaryLightColor,
                          activeTrackColor: AppColors.primaryDarkColor,
                          inactiveThumbColor: AppColors.primaryLightColor,
                          inactiveTrackColor: AppColors.DarkGreyColor,
                          value: weatherAlert,
                          onChanged: (value) {
                            setState(() {
                              weatherAlert = value;
                            });
                          }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ) ;
  }
}
