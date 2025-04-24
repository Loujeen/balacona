import 'package:flutter/material.dart';

class EditInformationScreen extends StatelessWidget {
  const EditInformationScreen({super.key});
  static const String routeName = 'EditInformationScreen';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            child:Image.asset("assets/images/edit_info_bg.png",width: double.infinity,height: double.infinity,fit:BoxFit.fill)
        ),
      ],

    );
  }
}
