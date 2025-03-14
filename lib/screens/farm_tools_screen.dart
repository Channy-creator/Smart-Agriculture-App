import 'package:flutter/material.dart';

class FarmToolsScreen extends StatelessWidget {
  const FarmToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of farm tools with names, descriptions, and image paths
    final List<Map<String, String>> tools = [
      {
        'name': 'Plow',
        'description': 'Used for tilling the soil.',
        'image': 'assets/plow.jpg'
      },
      {
        'name': 'Irrigation',
        'description': 'System for watering crops.',
        'image': 'assets/irrigation.jpg'
      },
      {
        'name': 'Fertilizer',
        'description': 'Used to enhance soil fertility.',
        'image': 'assets/fertilizer.jpg'
      },
      {
        'name': 'Tractor',
        'description': 'Used for plowing and other heavy tasks.',
        'image': 'assets/tractor.jpg'
      },
      {
        'name': 'Harvester',
        'description': 'Machine for harvesting crops.',
        'image': 'assets/harvester.jpg'
      },
      {
        'name': 'Seeder',
        'description': 'Used for planting seeds in the soil.',
        'image': 'assets/seeder.jpg'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Farm Tools'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 items per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.4, // Adjusted for 40% smaller size
          ),
          itemCount: tools.length,
          itemBuilder: (context, index) {
            return buildToolCard(tools[index]);
          },
        ),
      ),
    );
  }

  Widget buildToolCard(Map<String, String> tool) {
    String imagePath = tool['image'] ?? ''; // Get the image path
    String name = tool['name'] ?? ''; // Get the tool name
    String description = tool['description'] ?? ''; // Get the tool description

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // Image Section
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      imagePath), // Use the tool-specific background image
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Text Section without black background or border
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Text color adjusted
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                      height: 4), // Space between name and description
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors
                          .black54, // Slightly transparent color for description
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
