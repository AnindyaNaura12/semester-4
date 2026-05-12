import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/weather_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _uid => _auth.currentUser?.uid;

  // Simpan riwayat pencarian cuaca
  Future<void> saveWeatherSearch(WeatherModel weather) async {
    if (_uid == null) return;
    await _db
        .collection('users')
        .doc(_uid)
        .collection('weather_history')
        .add(weather.toMap());
  }

  // Ambil riwayat pencarian (terbaru dulu)
  Stream<QuerySnapshot> getWeatherHistory() {
    if (_uid == null) {
      return const Stream.empty();
    }
    return _db
        .collection('users')
        .doc(_uid)
        .collection('weather_history')
        .orderBy('savedAt', descending: true)
        .limit(10)
        .snapshots();
  }

  // Hapus satu riwayat
  Future<void> deleteHistory(String docId) async {
    if (_uid == null) return;
    await _db
        .collection('users')
        .doc(_uid)
        .collection('weather_history')
        .doc(docId)
        .delete();
  }

  // Simpan data profil user saat register
  Future<void> saveUserProfile(String email) async {
    if (_uid == null) return;
    await _db.collection('users').doc(_uid).set({
      'email': email,
      'createdAt': DateTime.now().toIso8601String(),
    }, SetOptions(merge: true));
  }
}