import 'package:flutter/material.dart';
import 'package:testttt/App_Colors.dart';

class KnowAboutPlantsScreen extends StatelessWidget {
  const KnowAboutPlantsScreen({super.key});
  static const String routeName = 'KnowAboutPlantsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLightColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // Stack عشان الخلفية + الصورة فوق النص
              Stack(
                clipBehavior: Clip.none, // مهم جدا عشان الصورة تطلع بره
                children: [
                  // الخلفية الزرقاء
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/login_signup_bg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // صورة النبتة
                  Positioned(
                    bottom: -60, // يحدد كم تبغي تنزلي الصورة على الأبيض
                    left: MediaQuery.of(context).size.width / 2 - 80, // توسيط الصورة بالنص
                    child: Container(
                      width: 160,
                      height: 160,
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
                ],
              ),

              // مسافة بسيطة تحت الصورة
              SizedBox(height: 80),

              // اسم النبتة
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

              SizedBox(height: 16),

              // الوصف
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

              SizedBox(height: 16),

              // Pictures Title
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

              // Horizontal List of Images
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
      ),
    );
  }

  // Helper to build small rounded images
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
