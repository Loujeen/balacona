import 'package:flutter/material.dart';
import 'package:testttt/App_Colors.dart';
import 'package:testttt/LoginSignup.dart';
import 'package:testttt/Register/register_column.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String routeName = 'RegisterScreen';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child:Image.asset("assets/images/register_bg.png",width: double.infinity,height: double.infinity,fit:BoxFit.fill)
        ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation:0,
          leading: IconButton(
              onPressed:(){
                Navigator.of(context).pushNamed(LoginSignup.routeName);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded ,
                color: AppColors.primaryDarkColor,)),
          title: Text(
            "Balacona",style: TextStyle(
              fontSize:22, color: AppColors.primaryDarkColor
              ,fontWeight: FontWeight.w300),),
          centerTitle: true,),

      body: registerColumn(),)
      ]

    );
  }
}
