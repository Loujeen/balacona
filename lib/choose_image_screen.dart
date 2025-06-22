import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ChooseImageScreen extends StatefulWidget {
  @override
  _ChooseImageScreenState createState() => _ChooseImageScreenState();
}

class _ChooseImageScreenState extends State<ChooseImageScreen> {
  File? _image;
  String _result = '';
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    final imageFile = File(pickedFile.path);
    setState(() => _image = imageFile);
    await _sendImageToFlask(imageFile);
  }

  Future<void> _sendImageToFlask(File image) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://10.0.2.2:5000/predict'),  // Use this IP for Android emulator
    );
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final data = jsonDecode(responseData);
      setState(() {
        _result = '${data['prediction']} (${data['confidence']} confidence)';
      });
    } else {
      setState(() => _result = 'Failed to get prediction');
    }
  }

  @override
  void initState() {
    super.initState();
    _pickImage();  // Automatically open picker when screen opens
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose an Image')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!, height: 200)
                : Text('No image selected'),
            SizedBox(height: 20),
            Text(_result, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
