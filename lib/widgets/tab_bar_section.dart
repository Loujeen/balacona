import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("For you", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
          Text("Following", style: TextStyle(color: Colors.grey[600], fontSize: 16.sp)),
        ],
      ),
    );
  }
}
