import 'package:flutter/material.dart';
import 'package:testttt/App_Colors.dart';

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Image.asset(
          "assets/images/edit_info_bg.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
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
                      crossAxisAlignment: CrossAxisAlignment.start, // Align all children to the left
                      children: [
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Builder(
                              builder: (context) {
                                double imageSize = screenWidth * 0.25;
                                double rightMargin = screenWidth * 0.025;
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
                        TextField(
                          controller: emailController,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 30),
                        TextField(
                          controller: phoneController,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(labelText: 'Phone Number'),
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: aboutController,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(labelText: 'About'),
                          maxLines: 4,
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 10),
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
                      onPressed: () {},
                      child: const Text(
                        'Save',
                        style: TextStyle(fontSize: 18, color: AppColors.LightButtonColor),
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
