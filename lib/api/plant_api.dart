import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/plant.dart';

class PlantApi {
  static Future<List<Plant>> fetchPlants() async {
    final url = Uri.parse('http://10.0.2.2:3000/plants'); // لو بتستخدمي Android Emulator

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((plantJson) => Plant.fromJson(plantJson)).toList();
    } else {
      throw Exception('Failed to load plants');
    }
  }
}

