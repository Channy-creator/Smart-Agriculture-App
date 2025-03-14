import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gevero/models/weather_data.dart';

class WeatherService {
  static const String apiKey =
      "YOUR_API_KEY"; // Replace with your actual API key
  static const String city = "New York"; // Modify as needed

  static Future<WeatherData> fetchWeatherData() async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return WeatherData.fromJson(data);
    } else {
      throw Exception("Failed to fetch weather data");
    }
  }
}
