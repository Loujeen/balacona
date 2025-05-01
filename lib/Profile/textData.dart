import 'package:flutter/material.dart';

class TextProfileData extends StatelessWidget {

  String text;
  Color textColor;
  FontWeight fontWeight;
  double fontSize;

  TextProfileData({required this.text , required this.textColor, required this.fontSize, required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor ,
          fontSize: fontSize,
          fontWeight: fontWeight
      ),
    );
  }
}
