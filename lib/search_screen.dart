import 'package:flutter/material.dart';
import 'package:testttt/Home_Screen/home_drawer.dart';

import 'App_Colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String routeName = 'SearchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          drawer: HomeDrawer(),
          backgroundColor: const Color(0xFFF0FFE7),
          appBar: AppBar(
            backgroundColor: const Color(0xFFF0FFE7),
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Balacona',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2B8C50),
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('Tapped on Winter');
                        },
                        child: const CategoryTile(
                          title: 'Winter',
                          imageUrl: 'assets/images/pot.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Tapped on Summer');
                        },
                        child: const CategoryTile(
                          title: 'Summer',
                          imageUrl: 'assets/images/pot.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Tapped on Spring');
                        },
                        child: const CategoryTile(
                          title: 'Spring',
                          imageUrl: 'assets/images/pot.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Tapped on Autumn');
                        },
                        child: const CategoryTile(
                          title: 'Autumn',
                          imageUrl: 'assets/images/pot.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // 📸 Camera Button Positioned
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
                side: BorderSide(color: AppColors.primaryDarkColor , width: 3),
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
}

class CategoryTile extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryTile({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final isLocal = imageUrl.startsWith('assets');

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Positioned.fill(
            child: isLocal
                ? Image.asset(imageUrl, fit: BoxFit.cover)
                : Image.network(imageUrl, fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFF0D5D40).withOpacity(0.8),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
