import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:testttt/Home_Screen/LearnAboutPlants.dart';
import 'package:testttt/Home_Screen/Popularplant.dart';
import 'package:testttt/Home_Screen/home_drawer.dart';
import 'package:testttt/search_screen.dart';
import 'package:testttt/weather_service.dart';

import '../App_Colors.dart';
import 'know_about_plants_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String locationText = 'Loading weather...';
  String? passedLocation;
  String? passedWeather;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      passedLocation = args['location'] as String?;
      passedWeather = args['weather'] as String?;
    }

    if (passedLocation != null && passedWeather != null) {
      setState(() {
        locationText = '$passedLocation\n$passedWeather';
      });
    } else {
      fetchWeather();
    }
  }

  void fetchWeather() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      final weatherService = WeatherService();
      final temp = await weatherService.getCurrentTemperature(
        position.latitude,
        position.longitude,
      );

      setState(() {
        locationText = temp;
      });
    } catch (e) {
      setState(() {
        locationText = 'Could not fetch weather';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.asset(
            "assets/images/Home.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          key: _scaffoldKey,
          drawer: HomeDrawer(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.primaryLightColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.menu, color: AppColors.primaryDarkColor),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            centerTitle: true,
            title: Text(
              'Balacona',
              style: TextStyle(
                color: AppColors.primaryDarkColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: AppColors.primaryDarkColor),
                onPressed: () {
                  Navigator.of(context).pushNamed(SearchScreen.routeName);
                },
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hi Peach Cat.\n',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),

                      TextSpan(
                        text: locationText,
                        style: TextStyle(
                            color: AppColors.primaryDarkColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                // Know about Plants
                Text(
                  'Know about Plants',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      6,
                          (index) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(KnowAboutPlantsScreen.routeName);
                          },
                          child: _imageBox('assets/images/pot.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                // Learn about Plants
                Text(
                  'Learn about Plants',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      5,
                          (index) => Padding(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(LearnAboutPlantScreen.routeName);
                          },
                          child: _learnPlantItem(
                            title: 'Coleus',
                            imageUrl: 'assets/images/pot.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                // Popular Plants
                Text(
                  'Popular Plants',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(PopularPlantScreen.routeName);
                        },
                        child: _scrollablePlantCard(
                          'Yarrow',
                          'Summer plant, less water required for growth',
                          'assets/images/pot.png',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(PopularPlantScreen.routeName);
                        },
                        child: _scrollablePlantCard(
                          'Ageratum',
                          'Winter plant, minimum\nwater needed',
                          'assets/images/pot.png',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(PopularPlantScreen.routeName);
                        },
                        child: _scrollablePlantCard(
                          'Lavender',
                          'Lovely scent and drought-resistant',
                          'assets/images/pot.png',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                // Seasonal Plants
                Text(
                  'Seasonal Plants',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(PopularPlantScreen.routeName);
                        },
                        child: _scrollablePlantCard(
                          'Yarrow',
                          'Summer plant, less water required for growth',
                          'assets/images/pot.png',
                        ),
                      ),
                      _scrollablePlantCard(
                        'Ageratum',
                        'Winter plant, minimum\nwater needed',
                        'assets/images/pot.png',
                      ),
                      _scrollablePlantCard(
                        'Lavender',
                        'Lovely scent and drought-resistant',
                        'assets/images/pot.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 20,
          child: SizedBox(
            width: 60,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                print('Camera button pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.GreenColor,
                shape: CircleBorder(),
                padding: EdgeInsets.zero,
                side: BorderSide(color: AppColors.primaryDarkColor, width: 3),
                elevation: 8,
              ),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _imageBox(String assetPath) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Widget _scrollablePlantCard(String title, String subtitle, String imageUrl) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryDarkColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageUrl,
              height: 100,
              width: 140,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.primaryLightColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              subtitle,
              style: TextStyle(
                color: AppColors.primaryLightColor,
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _learnPlantItem({required String title, required String imageUrl}) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primaryDarkColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Text(
            title,
            style: TextStyle(
              color: AppColors.primaryLightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
