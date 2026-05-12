import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  static const String _apiKey = 'YOUR_API_KEY'; // Ganti dengan API key Anda
  static const String _baseUrl = 'http://dataservice.accuweather.com';

  // Langkah 1: Cari location key dari nama kota
  Future<String?> getLocationKey(String cityName) async {
    final url = Uri.parse(
      '$_baseUrl/locations/v1/cities/search?apikey=$_apiKey&q=$cityName&language=id-id',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          return data[0]['Key'].toString();
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Langkah 2: Ambil data cuaca berdasarkan location key
  Future<WeatherModel?> getCurrentWeather(String cityName) async {
    final locationKey = await getLocationKey(cityName);
    if (locationKey == null) return null;

    final url = Uri.parse(
      '$_baseUrl/currentconditions/v1/$locationKey'
      '?apikey=$_apiKey&language=id-id&details=true',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          return WeatherModel.fromJson(data[0], cityName);
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}