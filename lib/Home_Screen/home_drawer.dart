import 'package:flutter/material.dart';
import 'package:testttt/Profile/profileScreen.dart';
import 'package:testttt/screens/community_screen.dart';

import '../App_Colors.dart';
import 'package:testttt/Home_Screen/Home_Screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryLightColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: BoxDecoration(
              color: AppColors.primaryDarkColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)
              ),
            ),
            child: Center(
              child: Text(
                'Balacona',
                style: TextStyle(
                  color: AppColors.primaryLightColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          _buildDrawerItem(Icons.home, 'Home', context),
          _buildDrawerItem(Icons.photo_camera, 'Capture your plant', context),
          _buildDrawerItem(Icons.person, 'Profile', context),
          _buildDrawerItem(Icons.group, 'Communities', context),
          _buildDrawerItem(Icons.videogame_asset, 'Play to win!', context),
          _buildDrawerItem(Icons.info, 'Info', context),
          _buildDrawerItem(Icons.local_florist, 'My Plants', context),
        ],
      ),
    );
  }

  static Widget _buildDrawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryDarkColor),
      title: Text(
        title,
        style: TextStyle(
            color: AppColors.primaryDarkColor,
            fontWeight: FontWeight.w900,
            fontSize: 16
        ),
      ),
      onTap: () {
        Navigator.pop(context); // close the drawer

        switch (title) {
          case 'Home':
            Navigator.of(context).pushNamed(HomeScreen.routeName);;
            break;
          case 'Capture your plant':
            Navigator.of(context).pushNamed('/capture');
            break;
          case 'Profile':
            Navigator.of(context).pushNamed(ProfileScreen.routeName);
            break;
          case 'Communities':
            Navigator.of(context).pushNamed(CommunityScreen.routeName);
            break;
          case 'Play to win!':
            Navigator.of(context).pushNamed('/game');
            break;
          case 'Info':
            Navigator.of(context).pushNamed('/info');
            break;
          case 'My Plants':
            Navigator.of(context).pushNamed('/my-plants');
            break;
        }
      },
    );
// Drawer(
    //   child: ListView(
    //     padding: EdgeInsets.zero,
    //     children: [
    //        DrawerHeader(
    //         decoration: BoxDecoration(color: AppColors.primaryDarkColor , ),
    //         child: Text('Balacona', style: TextStyle(color: AppColors.primaryLightColor, fontSize: 24, fontWeight: FontWeight.bold)),
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.home , color: AppColors.primaryDarkColor,),
    //         title: Text('Home'),
    //         onTap: () {
    //           Navigator.pushNamed(context, '/home');
    //         },
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.camera_alt , color: AppColors.primaryDarkColor),
    //         title: Text('Capture your plant'),
    //         onTap: () {
    //           Navigator.pushNamed(context, '/profile');
    //         },
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.person_rounded , color: AppColors.primaryDarkColor),
    //         title: Text('Profile'),
    //         onTap: () {
    //           Navigator.pushNamed(context, '/profile');
    //         },
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.groups_rounded, color: AppColors.primaryDarkColor),
    //         title: Text('Communities'),
    //         onTap: () {
    //           Navigator.pushNamed(context, '/profile');
    //         },
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.videogame_asset, color: AppColors.primaryDarkColor),
    //         title: Text('Play to win!'),
    //         onTap: () {
    //           Navigator.pushNamed(context, '/profile');
    //         },
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.info_rounded , color: AppColors.primaryDarkColor),
    //         title: Text('Info'),
    //         onTap: () {
    //           Navigator.pushNamed(context, '/profile');
    //         },
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.energy_savings_leaf, color: AppColors.primaryDarkColor),
    //         title: Text('My plants'),
    //         onTap: () {
    //           Navigator.pushNamed(context, '/profile');
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
