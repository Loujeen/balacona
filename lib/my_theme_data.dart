import 'package:flutter/material.dart';
import 'package:testttt/App_Colors.dart';
import 'package:testttt/my_theme_data.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyThemeData{

  static final ThemeData LightTheme = ThemeData(
      primaryColor: AppColors.primaryLightColor,
      scaffoldBackgroundColor: AppColors.WhiteColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryLightColor,
          elevation: 0
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.primaryLightColor,
          unselectedItemColor: AppColors.DarkGreyColor,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 0
      ),
      bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft:  Radius.circular(20),
                  topRight: Radius.circular(20)
              ),
              side: BorderSide(
                  color: AppColors.WhiteColor,
                  width: 4
              )
          )
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryLightColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(
                color: AppColors.WhiteColor,
                width: 5,
              )
          )
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.WhiteColor
        ),
        titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor
        ),
        bodyMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor
        ),
        bodySmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor
        ),
      )
  );
}