// lib/widgets/back_button_circle.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButtonCircle extends StatelessWidget {
  const BackButtonCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.green.shade700, width: 1.5),
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_back, size: 20.w, color: Colors.green.shade700),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
    );
  }
}
