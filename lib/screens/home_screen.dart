import 'package:flutter/material.dart';
import 'crop_monitoring_screen.dart';
import 'weather_data_screen.dart';
import 'farm_tools_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Smart Agriculture App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CropMonitoringScreen()));
              },
              child: Text('Crop Monitoring'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => WeatherDataScreen()));
              },
              child: Text('Weather Data'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => FarmToolsScreen()));
              },
              child: Text('Farm Tools'),
            ),
          ],
        ),
      ),
    );
  }
}
