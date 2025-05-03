import 'package:flutter/material.dart';
import 'package:testttt/App_Colors.dart';
import 'package:testttt/Profile/textData.dart';

class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}
bool isEnglish = false;
bool isArabic = false;

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
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
            TextProfileData(text: "Set Language", textColor: AppColors.WhiteColor, fontSize: 25, fontWeight: FontWeight.w500),
            Divider(
              thickness: 2,
              color: AppColors.WhiteColor,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextProfileData(text: "English", textColor: AppColors.GreenColor, fontSize: 25, fontWeight: FontWeight.w500),
                Switch(
                    activeColor: AppColors.primaryLightColor,
                    activeTrackColor: AppColors.GreenColor,
                    inactiveThumbColor: AppColors.primaryLightColor,
                    inactiveTrackColor: AppColors.DarkGreyColor,
                    value: isEnglish,
                    onChanged: (value) {
                      setState(() {
                        isEnglish = value;
                      });
                    }
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextProfileData(text: "Arabic", textColor: AppColors.GreenColor, fontSize: 25, fontWeight: FontWeight.w500),
                Switch(
                    activeColor: AppColors.primaryLightColor,
                    activeTrackColor: AppColors.GreenColor,
                    inactiveThumbColor: AppColors.primaryLightColor,
                    inactiveTrackColor: AppColors.DarkGreyColor,
                    value: isArabic,
                    onChanged: (value) {
                      setState(() {
                        isArabic = value;
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
