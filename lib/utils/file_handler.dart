import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart'; // Import Flutter for widgets
import 'package:path_provider/path_provider.dart';
import 'package:gevero/models/crop_data.dart'; // CropData model
import 'package:gevero/models/weather_data.dart'; // WeatherData model

class FileHandler {
  // Get the file path for crop data
  Future<File> _getCropDataFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/crop_data.json';
    return File(path);
  }

  // Read crop data from the file
  Future<List<CropData>> readCropData() async {
    try {
      final file = await _getCropDataFile();
      if (await file.exists()) {
        final jsonData = await file.readAsString();
        final List<dynamic> jsonList = json.decode(jsonData);
        return jsonList.map((item) => CropData.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      print('Error reading crop data: $e');
      return [];
    }
  }

  // Write new crop data to the file
  Future<void> writeCropData(CropData cropData) async {
    try {
      final file = await _getCropDataFile();
      List<CropData> existingData = await readCropData();
      existingData.add(cropData);
      final jsonData =
          json.encode(existingData.map((e) => e.toJson()).toList());
      await file.writeAsString(jsonData);
      print('Crop data saved successfully!');
    } catch (e) {
      print('Error saving crop data: $e');
    }
  }
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () async {
            FileHandler fileHandler = FileHandler();
            List<CropData> crops = await fileHandler.readCropData();
            // Use crops data to update UI or anything else
            print('Crops: $crops');
          },
          child: Text('Load Crop Data'),
        ),
      ),
    );
  }
}
