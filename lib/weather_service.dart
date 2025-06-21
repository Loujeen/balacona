import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String _apiKey = 'YOUR_API_KEY'; // Replace with your OpenWeatherMap API key
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<String> getCurrentTemperature(double lat, double lon) async {
    final url = '$_baseUrl?lat=$lat&lon=$lon&units=metric&appid=$_apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      // Safely parse the temperature to double
      final double temp = double.tryParse(jsonData['main']['temp'].toString()) ?? 0.0;
      final String city = jsonData['name'];

      return '${temp.toStringAsFixed(1)}°C in $city';
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
