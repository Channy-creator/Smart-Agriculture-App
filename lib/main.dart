import 'package:flutter/material.dart';
import 'package:gevero/screens/crop_monitoring_screen.dart'; // Import Crop Monitoring Screen
import 'package:gevero/screens/weather_data_screen.dart'; // Import Weather Data Screen
import 'package:gevero/screens/farm_tools_screen.dart'; // Import Farm Tools Screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Agriculture App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        '/crop-monitoring': (context) => CropMonitoringScreen(),
        '/weather-data': (context) => WeatherDataScreen(),
        '/farm-tools': (context) => FarmToolsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Agriculture Home'),
        leading: IconButton(
          icon: const Icon(Icons.menu), // Drawer icon
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Open the drawer when tapped
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[700],
              ),
              child: const Text(
                'Smart Agriculture',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Crop Monitoring'),
              onTap: () {
                Navigator.pushNamed(context, '/crop-monitoring');
              },
            ),
            ListTile(
              title: const Text('Weather Data'),
              onTap: () {
                Navigator.pushNamed(context, '/weather-data');
              },
            ),
            ListTile(
              title: const Text('Farm Tools'),
              onTap: () {
                Navigator.pushNamed(context, '/farm-tools');
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background.jpg'), // Ensure asset path is correct
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton(context, 'Crop Monitoring', '/crop-monitoring'),
              const SizedBox(height: 20),
              buildButton(context, 'Weather Data', '/weather-data'),
              const SizedBox(height: 20),
              buildButton(context, 'Farm Tools', '/farm-tools'),
            ],
          ),
        ),
      ),
      // Bottom navigation with only Home Text
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Home Text with Border
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: const Text(
                  'Home',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for creating the buttons in the HomeScreen
  Widget buildButton(BuildContext context, String title, String route) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.8),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(title),
      ),
    );
  }
}
