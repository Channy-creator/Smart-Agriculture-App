class CropData {
  final String cropName;
  final String growthStage;
  final double soilMoisture;
  final double temperature;
  final DateTime timestamp;

  CropData({
    required this.cropName,
    required this.growthStage,
    required this.soilMoisture,
    required this.temperature,
    required this.timestamp,
  });

  factory CropData.fromJson(Map<String, dynamic> json) {
    return CropData(
      cropName: json['cropName'],
      growthStage: json['growthStage'],
      soilMoisture: json['soilMoisture'],
      temperature: json['temperature'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cropName': cropName,
      'growthStage': growthStage,
      'soilMoisture': soilMoisture,
      'temperature': temperature,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
