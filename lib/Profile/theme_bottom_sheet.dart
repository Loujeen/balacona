import 'package:flutter/material.dart';
import 'package:testttt/App_Colors.dart';
import 'package:testttt/Profile/textData.dart';

class ThemeBottomSheet extends StatefulWidget {

  @override
  State<ThemeBottomSheet> createState() => _LanguageBottomSheetState();
}
bool isLight = false;
bool isDark = false;

class _LanguageBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryDarkColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(28) , topRight: Radius.circular(28) )
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.27,
      child:
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextProfileData(text: "Set Theme", textColor: AppColors.WhiteColor, fontSize: 25, fontWeight: FontWeight.w500),
            Divider(
              thickness: 2,
              color: AppColors.WhiteColor,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextProfileData(text: "Light Mode", textColor: AppColors.GreenColor, fontSize: 25, fontWeight: FontWeight.w500),
                Switch(
                    activeColor: AppColors.primaryLightColor,
                    activeTrackColor: AppColors.GreenColor,
                    inactiveThumbColor: AppColors.primaryLightColor,
                    inactiveTrackColor: AppColors.DarkGreyColor,
                    value: isLight,
                    onChanged: (value) {
                      setState(() {
                        isLight = value;
                      });
                    }
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextProfileData(text: "Dark Mode", textColor: AppColors.GreenColor, fontSize: 25, fontWeight: FontWeight.w500),
                Switch(
                    activeColor: AppColors.primaryLightColor,
                    activeTrackColor: AppColors.GreenColor,
                    inactiveThumbColor: AppColors.primaryLightColor,
                    inactiveTrackColor: AppColors.DarkGreyColor,
                    value: isDark,
                    onChanged: (value) {
                      setState(() {
                        isDark = value;
                      });
                    }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
