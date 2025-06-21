import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:testttt/App_Colors.dart';

class DiseasePredictionPage extends StatefulWidget {
  static const String routeName = 'DiseasePredictionScreen';
  @override
  _DiseasePredictionPageState createState() => _DiseasePredictionPageState();
}

class _DiseasePredictionPageState extends State<DiseasePredictionPage> {
  File? _image;
  String _result = '';
  bool _loading = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() => _image = File(pickedFile.path));
      await _uploadImage(File(pickedFile.path));
    }
  }

  Future<void> _uploadImage(File imageFile) async {
    setState(() {
      _loading = true;
      _result = '';
    });

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.1.26:5000/predict')
      , // Replace with your IP
    );

    request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    try {
      var response = await request.send();
      final res = await http.Response.fromStream(response);

      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        setState(() {
          _result = 'Class: ${data['class']}, Confidence: ${data['confidence'].toStringAsFixed(2)}';
        });
      } else {
        setState(() {
          _result = 'Error: ${res.body}';
        });
      }
    } catch (e) {
      setState(() {
        _result = 'Error sending request: $e';
      });
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLightColor,
      appBar: AppBar(title: Text("Plant Disease Predictor"),backgroundColor: AppColors.primaryLightColor,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _image != null ? Image.file(_image!, height: 200) : Container(),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: AppColors.primaryDarkColor,
                  minimumSize: Size(double.infinity, 66),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  _pickImage();
                },
                child: const Text(
                  'Pick Image',
                  style: TextStyle(
                      fontSize: 21, color: AppColors.LightButtonColor),
                ),
              ),
              SizedBox(height: 20),
              _loading ? CircularProgressIndicator() : Center(child: Text(_result,style: TextStyle(fontSize: 30),)),
            ],
          ),
        ),
      ),
    );
  }
}
