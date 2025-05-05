import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testttt/App_Colors.dart';

class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("For you", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
          Text("Following", style: TextStyle(color: AppColors.DarkGreyColor, fontWeight: FontWeight.bold, fontSize: 19)),
        ],
      ),
    );
  }
}
