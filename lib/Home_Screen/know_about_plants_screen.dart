import 'package:flutter/material.dart';
import 'package:testttt/App_Colors.dart';
import '../models/plant.dart';

class KnowAboutPlantsScreen extends StatelessWidget {
  const KnowAboutPlantsScreen({super.key});
  static const String routeName = 'KnowAboutPlantsScreen';

  @override
  Widget build(BuildContext context) {
    // استلام كائن الـ plant اللي جاي من الشاشة السابقة
    final Plant plants = ModalRoute.of(context)!.settings.arguments as Plant;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryLightColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primaryLightColor,
          ),
        ),
        title: Text(
          "Know About Plants",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.primaryLightColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/login_signup_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.20),

                  Center(
                    child: Container(
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white, width: 4),
                        image: DecorationImage(
                          image: NetworkImage(plants.image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),

                  Center(
                    child: Column(
                      children: [
                        Text(
                          plants.name,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      plants.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.7,
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Pictures of ${plants.name}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDarkColor,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        buildSmallImage(plants.image),
                        buildSmallImage(plants.image),
                        buildSmallImage(plants.image),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSmallImage(String url) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


