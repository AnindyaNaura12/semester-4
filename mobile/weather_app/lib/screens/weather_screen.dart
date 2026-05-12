import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../services/firestore_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _searchController = TextEditingController();
  final _weatherService = WeatherService();
  final _firestoreService = FirestoreService();
  WeatherModel? _weather;
  bool _isLoading = false;
  String? _error;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _searchWeather() async {
    final city = _searchController.text.trim();
    if (city.isEmpty) return;
    setState(() { _isLoading = true; _error = null; _weather = null; });
    final weather = await _weatherService.getCurrentWeather(city);
    if (!mounted) return;
    setState(() => _isLoading = false);
    if (weather == null) {
      setState(() => _error = 'Kota tidak ditemukan atau API error.');
    } else {
      setState(() => _weather = weather);
      await _firestoreService.saveWeatherSearch(weather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        title: const Text(
          'Cek Cuaca',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header melengkung
          Container(
            color: const Color(0xFF1565C0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF0F4FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onSubmitted: (_) => _searchWeather(),
                      decoration: InputDecoration(
                        hintText: 'Cari nama kota...',
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                        prefixIcon: const Icon(Icons.location_on_outlined,
                            color: Color(0xFF1565C0)),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                              color: Color(0xFF1565C0), width: 1.5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _searchWeather,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1565C0),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      child: const Icon(Icons.search_rounded, size: 22),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Konten
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _buildBody(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Color(0xFF1565C0)),
            SizedBox(height: 16),
            Text('Mengambil data cuaca...',
                style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_off_rounded, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(_error!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _searchWeather,
              child: const Text('Coba lagi'),
            ),
          ],
        ),
      );
    }

    if (_weather == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wb_sunny_outlined, size: 80,
                color: Colors.grey.shade300),
            const SizedBox(height: 16),
            Text('Ketik nama kota untuk melihat cuaca',
                style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
          ],
        ),
      );
    }

    return _buildWeatherCard(_weather!);
  }

  Widget _buildWeatherCard(WeatherModel weather) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Card utama suhu
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1565C0), Color(0xFF1E88E5), Color(0xFF42A5F5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1565C0).withOpacity(0.35),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [
                // Kota
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on, color: Colors.white70, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      weather.cityName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Icon cuaca
                Image.network(
                  'https://developer.accuweather.com/sites/default/files/'
                  '${weather.weatherIcon}-s.png',
                  width: 72,
                  height: 72,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.cloud, size: 72, color: Colors.white),
                ),
                const SizedBox(height: 8),

                // Suhu besar
                Text(
                  '${weather.temperature.toStringAsFixed(0)}°',
                  style: const TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                Text(
                  weather.weatherText,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Row info detail
          Row(
            children: [
              Expanded(
                child: _infoCard(
                  Icons.water_drop_outlined,
                  '${weather.humidity}%',
                  'Kelembaban',
                  const Color(0xFF29B6F6),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _infoCard(
                  Icons.air_rounded,
                  '${weather.windSpeed.toStringAsFixed(0)} km/h',
                  'Kecepatan Angin',
                  const Color(0xFF26A69A),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Banner tersimpan
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.check_circle_outline,
                    color: Colors.green.shade600, size: 18),
                const SizedBox(width: 8),
                Text(
                  'Data berhasil disimpan ke riwayat',
                  style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(IconData icon, String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700)),
              Text(label,
                  style: TextStyle(
                      fontSize: 11, color: Colors.grey.shade500)),
            ],
          ),
        ],
      ),
    );
  }
}