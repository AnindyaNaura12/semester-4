import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Image.network(
              'https://developer.accuweather.com/sites/default/files/'
              '${weather.weatherIcon}-s.png',
              width: 50,
              height: 50,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.cloud, size: 50, color: Color(0xFF1565C0)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(weather.cityName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('${weather.temperature}°C — ${weather.weatherText}',
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}