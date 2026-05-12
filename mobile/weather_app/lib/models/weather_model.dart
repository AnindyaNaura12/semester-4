class WeatherModel {
  final String cityName;
  final double temperature;
  final String weatherText;
  final int humidity;
  final double windSpeed;
  final String weatherIcon;
  final DateTime observationTime;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.weatherText,
    required this.humidity,
    required this.windSpeed,
    required this.weatherIcon,
    required this.observationTime,
  });

  // Parse dari JSON AccuWeather
  factory WeatherModel.fromJson(Map<String, dynamic> json, String city) {
    return WeatherModel(
      cityName: city,
      temperature: (json['Temperature']['Metric']['Value'] as num).toDouble(),
      weatherText: json['WeatherText'] ?? '',
      humidity: json['RelativeHumidity'] ?? 0,
      windSpeed: (json['Wind']['Speed']['Metric']['Value'] as num).toDouble(),
      weatherIcon: json['WeatherIcon'].toString().padLeft(2, '0'),
      observationTime: DateTime.parse(json['LocalObservationDateTime']),
    );
  }

  // Simpan ke Firestore
  Map<String, dynamic> toMap() {
    return {
      'cityName': cityName,
      'temperature': temperature,
      'weatherText': weatherText,
      'humidity': humidity,
      'windSpeed': windSpeed,
      'weatherIcon': weatherIcon,
      'observationTime': observationTime.toIso8601String(),
      'savedAt': DateTime.now().toIso8601String(),
    };
  }
}