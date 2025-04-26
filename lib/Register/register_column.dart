import 'package:flutter/material.dart';
import 'package:testttt/App_Colors.dart';
import 'package:testttt/Home_Screen/Home_Screen.dart';

class registerColumn extends StatelessWidget {
  const registerColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // or any background you want
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(height:MediaQuery.of(context).size.height*0.001),
              Text(
                'Register',
                style: TextStyle(
                  color: AppColors.primaryDarkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
               SizedBox(height:MediaQuery.of(context).size.height*0.001),
              Text(
                'Create your new account',
                style: TextStyle(
                  color: AppColors.DarkGreyColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 40),

              // Full Name
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.primaryDarkColor)
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                ),
              ),
               SizedBox(height:MediaQuery.of(context).size.height*0.02),

              // Email
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.primaryDarkColor)
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                ),
              ),
               SizedBox(height:MediaQuery.of(context).size.height*0.02),

              // Password
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.primaryDarkColor)
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                ),
              ),
               SizedBox(height:MediaQuery.of(context).size.height*0.02),

              // Confirm Password
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.primaryDarkColor)
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                ),
              ),
               SizedBox(height:MediaQuery.of(context).size.height*0.02),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'By signing you agree to our ',
                      style: TextStyle(color: AppColors.primaryDarkColor),
                    ),
                    TextSpan(
                      text: 'term of use\nand privacy notice',
                      style: TextStyle(
                        color: AppColors.DarkGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(height:MediaQuery.of(context).size.height*0.01),
        Image.asset('assets/images/pot.png',height:MediaQuery.of(context).size.height*0.2),
         SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppColors.primaryDarkColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            },
            child: Text(
              'Sign up',
              style: TextStyle(fontSize: 18,color: AppColors.LightButtonColor),
            ),
          ),
        ),
         SizedBox(height:MediaQuery.of(context).size.height*0.02),

        // Already have an account? Login
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('already have an account? '),
            GestureDetector(
              onTap: () {
                // Navigate to login screen
              },
              child: Text(
                'Login',
                style: TextStyle(
                  color: AppColors.primaryDarkColor,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ),SizedBox(height:MediaQuery.of(context).size.height*0.02 ,)],
          ),
        ],)
      ),
    ));
  }
}
