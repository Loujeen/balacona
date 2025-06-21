import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testttt/App_Colors.dart';
import 'package:testttt/Home_Screen/home_drawer.dart';
import '../widgets/AddPostScreen.dart';
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryLightColor,
        child: Icon(Icons.add, color: AppColors.primaryDarkColor),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPostScreen()),
          );
        },
      ),

      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('posts').orderBy('timestamp', descending: true).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                final data = snapshot.data?.docs ?? [];

                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final doc = data[index];
                    final post = Post.fromMap(doc.data() as Map<String, dynamic>);
                    return PostCard(post: post, postId: doc.id);
                  },
                );

              },
            ),
          ),

        ],
      ),
    );
  }
}
