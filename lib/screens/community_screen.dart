import 'package:flutter/material.dart';
import 'package:testttt/App_Colors.dart';
import 'package:testttt/Home_Screen/home_drawer.dart';
import '../widgets/post_card.dart';
import '../widgets/tab_bar_section.dart';
import '../models/post.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});
  static const String routeName = 'communityScreen';

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer:  HomeDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.primaryLightColor,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: AppColors.primaryDarkColor),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        title: Text(
          'Balacona',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.primaryDarkColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TabBarSection(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostCard(post: posts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
