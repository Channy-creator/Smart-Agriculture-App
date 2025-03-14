import 'package:flutter/material.dart';
import 'package:gevero/utils/file_handler.dart';
import 'package:gevero/models/crop_data.dart';

class CropMonitoringScreen extends StatefulWidget {
  const CropMonitoringScreen({super.key});

  @override
  _CropMonitoringScreenState createState() => _CropMonitoringScreenState();
}

class _CropMonitoringScreenState extends State<CropMonitoringScreen> {
  final FileHandler fileHandler = FileHandler();
  List<CropData> crops = [];

  final TextEditingController cropNameController = TextEditingController();
  final TextEditingController growthStageController = TextEditingController();
  final TextEditingController soilMoistureController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCrops();
  }

  // Load crops from the file (called once when screen is loaded)
  void _loadCrops() async {
    crops = await fileHandler.readCropData();
    setState(() {});
  }

  // Add crop to the list and save to the file
  void _addCrop() async {
    String cropName = cropNameController.text;
    String growthStage = growthStageController.text;
    double soilMoisture = double.tryParse(soilMoistureController.text) ?? 0.0;
    double temperature = double.tryParse(temperatureController.text) ?? 0.0;

    CropData newCrop = CropData(
      cropName: cropName,
      growthStage: growthStage,
      soilMoisture: soilMoisture,
      temperature: temperature,
      timestamp: DateTime.now(),
    );

    // Save the new crop to the file
    await fileHandler.writeCropData(newCrop);

    // Add the new crop to the list immediately and update the UI
    setState(() {
      crops.add(newCrop);
    });

    // Clear the text fields after adding the crop
    cropNameController.clear();
    growthStageController.clear();
    soilMoistureController.clear();
    temperatureController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crop Monitoring")),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: cropNameController,
                    decoration: InputDecoration(labelText: 'Crop Name'),
                  ),
                  TextField(
                    controller: growthStageController,
                    decoration: InputDecoration(labelText: 'Growth Stage'),
                  ),
                  TextField(
                    controller: soilMoistureController,
                    decoration: InputDecoration(labelText: 'Soil Moisture (%)'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: temperatureController,
                    decoration: InputDecoration(labelText: 'Temperature (°C)'),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                    onPressed: _addCrop,
                    child: Text('Add Crop'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: crops.length,
                itemBuilder: (context, index) {
                  final crop = crops[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        crop.cropName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(crop.growthStage),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("${crop.soilMoisture}%"),
                          Text("${crop.temperature}°C"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Bottom buttons without icons
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home button
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text("Home"),
            ),
            // Back button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
