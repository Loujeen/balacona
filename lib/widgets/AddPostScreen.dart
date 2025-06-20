import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final captionController = TextEditingController();
  final quotedController = TextEditingController();

  void addPost() async {
    final caption = captionController.text.trim();
    final quoted = quotedController.text.trim();
    if (caption.isEmpty) return;

    await FirebaseFirestore.instance.collection('posts').add({
      'caption': caption,
      'quoted': quoted.isNotEmpty ? quoted : null,
      'timestamp': Timestamp.now(),
      'likes': 0,
      'comments': 0,
      'shares': 0,
    });


    Navigator.pop(context); // يرجع للشاشة السابقة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Post")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: captionController,
              decoration: InputDecoration(labelText: 'Caption'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: quotedController,
              decoration: InputDecoration(labelText: 'Quoted (optional)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addPost,
              child: Text("Post"),
            )
          ],
        ),
      ),
    );
  }
}
