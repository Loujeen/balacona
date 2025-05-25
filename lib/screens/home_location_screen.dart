// lib/screens/home_location_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testttt/App_Colors.dart';
import '../widgets/back_button_circle.dart';

class HomeLocationScreen extends StatelessWidget {
  const HomeLocationScreen({super.key});
  static const String routeName = 'HomeLocationSCreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLightColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height: 20.h),
          const BackButtonCircle(),
          SizedBox(height: 20.h),
          Center(
            child: Text(
              'Balacona',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryDarkColor,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Text(
            'Smouha, Alexandria',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDarkColor,
            ),
          ),
          Text(
            '24°C',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryDarkColor,
            ),
          ),
          SizedBox(height: 30.h),
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.primaryDarkColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
              'Welcome',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
            "Let's start by setting up a place/\\nroom where you save your plants.",
            style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryDarkColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            leading: Image.asset(
              'assets/images/plant.png',
              width: 40.w,
              height: 40.h,
            ),
            title: Text(
              'Add place',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'Start',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 18.sp,
              color: AppColors.WhiteColor,
            ),
            onTap: () {
              // TODO: Handle navigation to add place
            },
          ),
        )
        ],
      ),
    ),
    ],
    ),
    ),
    ),
    );
  }
}
