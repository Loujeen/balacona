import 'package:flutter/material.dart';
import '../App_Colors.dart';

class LearnAboutPlantScreen extends StatelessWidget {
  const LearnAboutPlantScreen({super.key});
  static const String routeName = 'LearnAboutPlants';

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final screenWidth = media.width;
    final screenHeight = media.height;

    return Scaffold(
      backgroundColor: AppColors.primaryLightColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: AppColors.blackColor),
        ),
        title: Text(
          'Learn about Plants',
          style: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.05,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenHeight * 0.025),
        child: ListView(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.015),
                decoration: BoxDecoration(
                  color: AppColors.primaryDarkColor,
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.1,
                      child: Image.asset("assets/images/pot.png", fit: BoxFit.contain),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      'Coleus',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.04),

            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis dictum egestas dolor egestas. Netus pharetra, rhoncus tortor duis sit. '
                  'In ipsum diam orci morbi ultrices massa amet. Aenean urna phasellus eget vestibulum, vulputate dui auctor sed est. '
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis dictum egestas dolor egestas.',
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                height: 1.6,
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            ClipRRect(
              borderRadius: BorderRadius.circular(screenWidth * 0.03),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/pot.png",
                    height: screenHeight * 0.4,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Icon(Icons.play_arrow, color: Colors.white, size: screenWidth * 0.09),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}
