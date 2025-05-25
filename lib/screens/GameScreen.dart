import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testttt/App_Colors.dart';
import 'package:testttt/Home_Screen/Home_Screen.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
  static const String routeName = 'GameScreen';
}

class _GameScreenState extends State<GameScreen> {
  int stage = 0;
  DateTime? lastWatered;

  final List<String> plantStages = [
    'assets/images/plantBno1.png',
    'assets/images/plantBno2.png',
    'assets/images/plantBno3.png',
    'assets/images/plantBno4.png',
    'assets/images/plantBno6.png',
    'assets/images/plantAno1.png',
    'assets/images/plantAno2.png',
    'assets/images/plantAno3.png',
    'assets/images/plantAno4.png',
    'assets/images/plantAno5.png',
    'assets/images/plantCno1.png',
    'assets/images/plantCno2.png',
    'assets/images/plantCno3.png',
    'assets/images/plantCno4.png',
    'assets/images/plantCno5.png',
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      stage = prefs.getInt('stage') ?? 0;
      final lastDate = prefs.getString('lastWatered');
      if (lastDate != null) {
        lastWatered = DateTime.tryParse(lastDate);
      }
    });
  }

  Future<void> waterPlant() async {
    final now = DateTime.now();
    if (lastWatered != null &&
        lastWatered!.year == now.year &&
        lastWatered!.month == now.month &&
        lastWatered!.day == now.day) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You already watered your plant')),
      );
      return;
    }

    if (stage >= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Wohooo your plant has grown')),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      stage += 1;
      lastWatered = now;
    });

    await prefs.setInt('stage', stage);
    await prefs.setString('lastWatered', now.toIso8601String());
  }

  double get progressValue => (stage + 1) / 5;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(children: [
      Container(
        child: Image.asset(
          "assets/images/game.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
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
              color: AppColors.primaryLightColor,
            ),
          ),
          title: Text(
            "Water Me",
            style: TextStyle(

              fontSize: 24,
              color: AppColors.primaryLightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
            ),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "I need some water to be hydrated \n please gimme some water to drink.",
                  style: TextStyle(
                    color: AppColors.primaryLightColor,
                    fontSize: screenWidth * 0.045,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.04),

                ElevatedButton(
                  onPressed: waterPlant,
                  child: Text(
                    'Water the plant',
                    style: TextStyle(
                      color: AppColors.primaryDarkColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.LightBlueColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.25,
                      vertical: screenHeight * 0.015,
                    ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))
                  ),
                ),SizedBox(height: screenHeight * 0.25),
                Container(
                  child: Image.asset(
                    plantStages[stage],
                    height: screenHeight * 0.25,
                  ),decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(120)),color: AppColors.WhiteColor
                ),width: 221,height: 221,
                ),
                SizedBox(height: screenHeight * 0.07),
                LinearProgressIndicator(
                  value: progressValue,
                  minHeight: screenHeight * 0.015,
                  backgroundColor: AppColors.LightButtonColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primaryDarkColor),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
