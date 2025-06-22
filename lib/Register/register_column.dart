import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testttt/App_Colors.dart';
import 'package:testttt/Home_Screen/Home_Screen.dart';
import 'package:testttt/firebase_utils.dart';
import 'package:testttt/model/my_user.dart';
import 'package:testttt/providers/auth_user_provider.dart';
import 'package:testttt/dialog_utils.dart';
import 'package:testttt/screens/location_screen.dart';


class RegisterColumn extends StatefulWidget {
  const RegisterColumn({super.key});

  @override
  State<RegisterColumn> createState() => _RegisterColumnState();
}

class _RegisterColumnState extends State<RegisterColumn> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  void register(BuildContext context) async {
    if (formKey.currentState?.validate() != true) return;

    DialogUtils.showLoading(context: context, message: "Loading...");

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      MyUser myUser = MyUser(
        id: credential.user?.uid ?? '',
        name: fullNameController.text,
        email: emailController.text,
      );

      var authProvider = Provider.of<AuthUserProvider>(context, listen: false);
      authProvider.updateUser(myUser);
      await FirebaseUtils.addUserToFireStore(myUser);

      DialogUtils.hideLoading(context);

      DialogUtils.showMessage(
        context: context,
        content: "Register Successfully.",
        title: "Success",
        posActionName: "Ok",
        posAction: () {
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        },
      );
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideLoading(context);

      if (e.code == 'weak-password') {
        DialogUtils.showMessage(
          context: context,
          content: "The password provided is too weak.",
          title: "Error",
          posActionName: "Ok",
        );
      } else if (e.code == 'email-already-in-use') {
        DialogUtils.showMessage(
          context: context,
          content: "The account already exists for that email.",
          title: "Error",
          posActionName: "Ok",
        );
      } else {
        DialogUtils.showMessage(
          context: context,
          content: e.message ?? 'Registration failed',
          title: "Error",
          posActionName: "Ok",
        );
      }
    } catch (e) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
        context: context,
        content: e.toString(),
        title: "Error",
        posActionName: "Ok",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.001),
                Text(
                  'Register',
                  style: TextStyle(
                    color: AppColors.primaryDarkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                Text(
                  'Create your new account',
                  style: TextStyle(
                    color: AppColors.DarkGreyColor,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 40),

                // Full Name
                TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Email
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter your email";
                    }
                    final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(text);
                    if (!emailValid) {
                      return "Please enter a valid email.";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Password
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter your password";
                    }
                    if (text.length < 6) {
                      return "Password should be at least 6 characters.";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Confirm Password
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please confirm your password";
                    }
                    if (text != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By signing you agree to our ',
                        style: TextStyle(color: AppColors.primaryDarkColor),
                      ),
                      TextSpan(
                        text: 'terms of use and privacy notice',
                        style: TextStyle(
                          color: AppColors.DarkGreyColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Image.asset('assets/images/pot.png',
                    height: MediaQuery.of(context).size.height * 0.2),
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
                      if (formKey.currentState?.validate() != true) return;

                      Navigator.pushNamed(
                        context,
                        LocationScreen.routeName,
                        arguments: {
                          'name': fullNameController.text,
                          'email': emailController.text,
                          'password': passwordController.text,
                        },
                      );
                    },

                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 22, color: AppColors.LightButtonColor),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Already have an account?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); // or navigate to login
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: AppColors.primaryDarkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
