import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testttt/App_Colors.dart';
import 'package:testttt/Home_Screen/Home_Screen.dart';
import 'package:testttt/Register/registerScreen.dart';
import 'package:testttt/dialog_utils.dart';
import 'package:testttt/firebase_utils.dart';
import '../providers/auth_user_provider.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> login() async {
    if (emailController.text.trim().isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email and password cannot be empty')),
      );
      return;
    }

    DialogUtils.showLoading(context: context, message: 'Logging in...');

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      print("✅ Auth success. Now reading Firestore...");

      var user = await FirebaseUtils.readUserFromFireStore(credential.user?.uid ?? '')
          .timeout(Duration(seconds: 10), onTimeout: () {
        throw Exception("❌ Timeout while reading user data from Firestore.");
      });

      if (user == null) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          title: 'Error',
          content: 'No user found in Firestore for this UID.',
          posActionName: 'Ok',
        );
        return;
      }

      // ✅ Set user in AuthUserProvider
      Provider.of<AuthUserProvider>(context, listen: false).updateUser(user);

      DialogUtils.hideLoading(context);

      DialogUtils.showMessage(
        context: context,
        title: 'Success',
        content: 'Login Successfully.',
        posActionName: 'OK',
        posAction: () {
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        },
      );
      print("✅ Login Successfully.");
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
        context: context,
        title: 'Auth Error',
        content: e.message ?? 'Unknown Firebase Auth error',
        posActionName: 'OK',
      );
      print("❌ Firebase Auth Error: ${e.code}");
    } catch (e) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
        context: context,
        title: 'Error',
        content: e.toString(),
        posActionName: 'OK',
      );
      print("❌ General Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLightColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: BottomWaveClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 410,
                    decoration: BoxDecoration(
                      color: AppColors.WhiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 60.h),
                      child: Image.asset(
                        'assets/images/login.jpeg',
                        height: 250.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 20.w,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.WhiteColor,
                      child: Icon(Icons.arrow_back_ios_rounded, color: AppColors.primaryDarkColor),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Balacona',
              style: GoogleFonts.poppins(
                fontSize: 50,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryDarkColor,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Login to your account',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.DarkGreyColor,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(height: 14.h),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (_) {},
                        activeColor: AppColors.primaryDarkColor,
                      ),
                      Text(
                        'Remember me',
                        style: GoogleFonts.poppins(fontSize: 12.sp),
                      ),
                      const Spacer(),
                      Text(
                        'Forget Password?',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: AppColors.primaryDarkColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryDarkColor,
                        minimumSize: Size(double.infinity, 66),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: login,
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: GoogleFonts.poppins(fontSize: 13.sp),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(RegisterScreen.routeName);
                        },
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            color: AppColors.primaryDarkColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
