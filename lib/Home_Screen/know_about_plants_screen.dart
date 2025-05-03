import 'package:flutter/material.dart';
import 'package:testttt/App_Colors.dart';

class KnowAboutPlantsScreen extends StatelessWidget {
  const KnowAboutPlantsScreen({super.key});
  static const String routeName = 'KnowAboutPlantsScreen';

  @override
  Widget build(BuildContext context) {
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
            fontSize: 22,
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [

          Container(
            height: MediaQuery.of(context).size.height * 0.35,
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
                SizedBox(height: kToolbarHeight + 40),


                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.25,
                    height: MediaQuery.of(context).size.height*0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white, width: 4),
                      image: DecorationImage(
                        image: AssetImage("assets/images/pot.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.025),


                Center(
                  child: Column(
                    children: [
                      Text(
                        'Ginkgo',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Ginkgo biloba',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.02),


                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Turpis dictum egestas dolor egestas. Netus pharetra, '
                        'rhoncus tortor duis sit. In ipsum diam orci morbi ultrices '
                        'massa amet. Aenean urna phasellus eget vestibulum, '
                        'vulputate dui auctor sed est. Lorem ipsum dolor sit amet, '
                        'consectetur adipiscing elit. Turpis dictum egestas dolor egestas.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.02),


                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Pictures of Ginkgo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ),

                SizedBox(height: 16),


                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      buildSmallImage('assets/images/pot.png'),
                      buildSmallImage('assets/images/pot.png'),
                      buildSmallImage('assets/images/pot.png'),
                    ],
                  ),
                ),

                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget buildSmallImage(String url) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

