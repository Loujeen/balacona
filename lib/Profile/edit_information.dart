import 'package:flutter/material.dart';
import 'package:testttt/App_Colors.dart';
import 'dart:ui';

class EditInformationScreen extends StatefulWidget {
  const EditInformationScreen({super.key});
  static const String routeName = 'EditInformationScreen';


  @override
  State<EditInformationScreen> createState() => _EditInformationScreenState();
}

class _EditInformationScreenState extends State<EditInformationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool isEmailEditable = false;
  bool isPhoneEditable = false;
  bool isAboutEditable = false;
  bool isPasswordEditable = false;

  @override
  void initState() {
    super.initState();
    emailController.text = "karima@example.com";
    phoneController.text = "01012345678";
    aboutController.text = "CS student and plant lover 🌿";
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Stack(
          children: [
            Image.asset(
              "assets/images/edit_info_bg.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Adjust sigma values for blur strength
                child: Container(
                  color: Colors.black.withOpacity(0), // Optional: this can add a slight overlay
                ),
              ),
            ),
          ],
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.primaryDarkColor,
              ),
            ),
            title: Text(
              "EDIT INFORMATION",
              style: TextStyle(
                fontSize: 22,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Builder(
                              builder: (context) {
                                double imageSize = screenWidth * 0.25;
                                return Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 17, 0),
                                  width: imageSize,
                                  height: imageSize,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/pot.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'MY NAME',
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),

                        // Password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Password',style: TextStyle(fontSize: 19),),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isPasswordEditable = true;
                                  passwordController.text = ''; // Clear field for new password
                                });
                              },
                              child: Text(
                                "Change",
                                style: TextStyle(
                                  color: AppColors.primaryDarkColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: passwordController,
                          enabled: isPasswordEditable,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: isPasswordEditable ? "Enter new password" : "********",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                color: AppColors.primaryDarkColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                        ),

                        SizedBox(height: 30),

                        // Email
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Email',style: TextStyle(fontSize: 19),),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isEmailEditable = true;
                                });
                              },
                              child: Text(
                                "Change",
                                style: TextStyle(
                                  color: AppColors.primaryDarkColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: emailController,
                          enabled: isEmailEditable,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: emailController.text
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 30),

                        // Phone Number
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Phone Number',style: TextStyle(fontSize: 19),),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isPhoneEditable = true;
                                });
                              },
                              child: Text(
                                "Change",
                                style: TextStyle(
                                  color: AppColors.primaryDarkColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: phoneController,
                          enabled: isPhoneEditable,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(),
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 30),

                        // About
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('About',style: TextStyle(fontSize: 19),),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAboutEditable = true;
                                });
                              },
                              child: Text(
                                "Change",
                                style: TextStyle(
                                  color: AppColors.primaryDarkColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: aboutController,
                          enabled: isAboutEditable,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05, vertical: 10),
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
                        isAboutEditable=false;
                        isPasswordEditable=false;
                        isPhoneEditable=false;
                        isEmailEditable=false;
                        // Save logic here
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 18, color: AppColors.LightButtonColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
