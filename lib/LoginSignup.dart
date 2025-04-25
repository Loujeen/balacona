import 'package:flutter/material.dart';
import 'package:testttt/App_Colors.dart';


class LoginSignup extends StatelessWidget {
  const LoginSignup({Key? key}) : super(key: key);
  static const String routeName = 'LoginSignup';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/login_signup_bg.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Align(
          alignment: Alignment.centerLeft, // Aligns the container to the center left of the screen
          child: Container(
            padding: EdgeInsets.all(16), // Add some padding for spacing
            child: Text(
              "A STEP\nTOWARDS \nLESS\nPOLLUTION",
              style: TextStyle(
                color: AppColors.WhiteColor, // Assuming this is the color defined in AppColors
                fontSize: 42, // Adjust the font size as needed
                fontWeight: FontWeight.w900, // Optional, make it bold for emphasis
                decoration: TextDecoration.none, // Removes any underline
              ),
              textAlign: TextAlign.left, // Align text to the left within the container
            ),
          )

        ),

        Scaffold(
          backgroundColor: Colors.transparent, // Make sure the background is transparent
          body: Column(
            children: [
              Spacer(), // This pushes the buttons to the bottom

              // Log In Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppColors.primaryDarkColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {

                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 18, color: AppColors.LightButtonColor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Add space between buttons

              // Sign Up Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppColors.LightButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // Sign up logic here
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 18, color: AppColors.primaryDarkColor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Optional space at the bottom
            ],
          ),
        ),
      ],
    );
  }
}
