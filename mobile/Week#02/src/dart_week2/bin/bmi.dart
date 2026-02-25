// Mengimpor file bmi.dart yang berisi fungsi hitungBMI dan kategoriBMI
import 'package:dart_week2/bmi.dart';

// Mengimpor library untuk input dan output di terminal
import 'dart:io';

void main() {
  // Menampilkan pesan untuk memasukkan berat badan dalam satuan kilogram (kg)
  stdout.write("Masukkan berat badan (kg): ");
  // Membaca input dalam bentuk String, lalu dikonversi ke tipe double
  double berat = double.parse(stdin.readLineSync()!);

  // Meminta input tinggi badan dalam centimeter dan konversi ke tipe double
  stdout.write("Masukkan tinggi badan (cm): ");
  double tinggiCm = double.parse(stdin.readLineSync()!);

  // Mengubah tinggi dari cm ke meter (karena BMI satuan tinggi menggunakan meter)
  double tinggiMeter = tinggiCm / 100;

  // Menghitung BMI menggunakan fungsi dari bmi.dart
  double bmi = hitungBMI(berat, tinggiMeter);

  // Menentukan kategori BMI
  String kategori = kategoriBMI(bmi);

  print("\n=== HASIL PERHITUNGAN BMI ===");
  // Menampilkan hasil BMI dengan 2 angka di belakang koma
  print("BMI Anda: ${bmi.toStringAsFixed(2)}");
  print("Kategori: $kategori");
}
