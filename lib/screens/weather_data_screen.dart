import 'package:flutter/material.dart';
import 'package:gevero/models/weather_data.dart'; // Import the WeatherData model

class WeatherDataScreen extends StatelessWidget {
  const WeatherDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example of using today's weather data
    WeatherData todayWeather = WeatherData(
      temperature: 30.0,
      humidity: 82,
      windSpeed: 4.3,
      weatherCondition: 'Cloudy',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Data"),
        backgroundColor: Colors.green[700], // Matching the theme
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.lightGreen],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 8,
            color: Colors.white.withOpacity(0.9),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Today's Weather",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16),
                  weatherInfo(
                      "🌡 Temperature", "${todayWeather.temperature}°C"),
                  weatherInfo("💧 Humidity", "${todayWeather.humidity}%"),
                  weatherInfo(
                      "🌬 Wind Speed", "${todayWeather.windSpeed} km/h"),
                  weatherInfo("⛅ Condition", todayWeather.weatherCondition),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget weatherInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
