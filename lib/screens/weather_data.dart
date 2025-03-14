class WeatherData {
  final double temperature;
  final int humidity;
  final double windSpeed;
  final String weatherCondition;

  WeatherData({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.weatherCondition,
  });

  // fromJson method to parse JSON data into a WeatherData object
  factory WeatherData.fromJson(Map<String, dynamic> data) {
    return WeatherData(
      temperature:
          data['main']['temp'].toDouble(), // Assuming 'temp' is in 'main' field
      humidity: data['main']
          ['humidity'], // Assuming 'humidity' is in 'main' field
      windSpeed: data['wind']['speed']
          .toDouble(), // Assuming 'speed' is in 'wind' field
      weatherCondition: data['weather'][0]
          ['description'], // Assuming 'description' is in 'weather' array
    );
  }

  // Optional: toJson method to convert WeatherData object to JSON (if needed for sending to an API)
  Map<String, dynamic> toJson() {
    return {
      'main': {
        'temp': temperature,
        'humidity': humidity,
      },
      'wind': {
        'speed': windSpeed,
      },
      'weather': [
        {'description': weatherCondition}
      ],
    };
  }
}

// Example of today's weather data
WeatherData todayWeather = WeatherData(
  temperature: 30.0, // Current temperature in Celsius
  humidity: 82, // Average humidity percentage
  windSpeed: 4.3, // Average wind speed in km/h
  weatherCondition: 'Cloudy', // General weather condition
);
