import 'package:flutter/material.dart';
import 'package:testttt/Home_Screen/LearnAboutPlants.dart';
import 'package:testttt/Home_Screen/Popularplant.dart';
import 'package:testttt/Home_Screen/home_drawer.dart';
import 'package:testttt/search_screen.dart';
import 'package:testttt/weather_service.dart';
import 'package:geolocator/geolocator.dart';

import '../App_Colors.dart';
import '../api/plant_api.dart';
import '../models/plant.dart';
import 'know_about_plants_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<List<Plant>> futurePlants;

  String locationText = 'Loading weather...';
  String? passedLocation;
  String? passedWeather;

  @override
  void initState() {
    super.initState();
    futurePlants = PlantApi.fetchPlants();
  }

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
      setState(() {
        locationText = 'Smouha, Alexandria\n24°C';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/Home.png", width: double.infinity, height: double.infinity, fit: BoxFit.fill),
        Scaffold(
          key: _scaffoldKey,
          drawer: HomeDrawer(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.primaryLightColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.menu, color: AppColors.primaryDarkColor),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Hi Peach Cat.\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                        text: locationText,
                        style: TextStyle(
                          color: AppColors.primaryDarkColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // Know about Plants
                Text('Know about Plants', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 8),
                FutureBuilder<List<Plant>>(
                  future: futurePlants,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    final plants = snapshot.data!;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: plants.map((plant) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(KnowAboutPlantsScreen.routeName, arguments: plant);
                            },
                            child: _imageBoxFromNetwork(plant.image),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),

                // Learn about Plants
                Text('Learn about Plants', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 8),
                FutureBuilder<List<Plant>>(
                  future: futurePlants,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    final plants = snapshot.data!;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: plants.map((plant) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(LearnAboutPlantScreen.routeName, arguments: plant);
                            },
                            child: _learnPlantItem(title: plant.name, imageUrl: plant.image),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),

                // Popular Plants
                Text('Popular Plants', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 8),
                FutureBuilder<List<Plant>>(
                  future: futurePlants,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    final plants = snapshot.data!;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: plants.map((plant) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(PopularPlantScreen.routeName, arguments: plant);
                            },
                            child: _scrollablePlantCard(plant.name, plant.description, plant.image),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),

                // Seasonal Plants (Static)
                Text('Seasonal Plants', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _scrollablePlantCard('Yarrow', 'Summer plant, less water required', 'https://example.com/image1.png'),
                      _scrollablePlantCard('Ageratum', 'Winter plant, minimum water needed', 'https://example.com/image2.png'),
                      _scrollablePlantCard('Lavender', 'Lovely scent and drought-resistant', 'https://example.com/image3.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Camera Button
        Positioned(
          bottom: 30,
          right: 20,
          child: ElevatedButton(
            onPressed: () => print('Camera button pressed'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.GreenColor,
              shape: CircleBorder(),
              padding: EdgeInsets.zero,
              side: BorderSide(color: AppColors.primaryDarkColor, width: 3),
              elevation: 8,
            ),
            child: Icon(Icons.camera_alt, color: Colors.white, size: 30),
          ),
        ),
      ],
    );
  }

  Widget _imageBoxFromNetwork(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
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
      child: Image.network(
          imageUrl,
          height: 100,
          width: 140,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => Icon(Icons.error, color: Colors.red),
    ),
    ),
    SizedBox(height: 10),
    Align(
    alignment: Alignment.centerLeft,
    child: Text(
    title,
    style: TextStyle(
    color: AppColors.primaryLightColor,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    ),
    ),
    ),
    SizedBox(height: 4),
    Align(
    alignment: Alignment.centerLeft,
    child: Text(
    subtitle,
    style: TextStyle(color: AppColors.primaryLightColor, fontSize: 12, height: 1.4),
    ),
    ),
    ],
    ),
    );
    }

  Widget _learnPlantItem({required String title, required String imageUrl}) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryDarkColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
      ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
          imageUrl,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => Icon(Icons.error, color: Colors.white),
    ),
    ),
    SizedBox(width: 8),
    Text(title, style: TextStyle(color: AppColors.primaryLightColor, fontWeight: FontWeight.bold)),
    ],
    ),
    );
  }
}