// Mengimpor file unit_convertion.dart untuk fungsi konversi dan Map unit
import 'package:dart_week2/unit_convertion.dart';
import 'dart:io';

void main() {
  print("=== APLIKASI KONVERSI UNIT ===");

  // Loop untuk menampilkan menu berulang-ulang sampai user memilih keluar
  while (true) {
    print("\nPilih Kategori:");
    print("1. Panjang (meter, kilometer, centimeter, millimeter, mile)");
    print("2. Massa (kilogram, gram, milligram, ton, pound)");
    print("3. Volume (liter, milliliter, cubic_meter, gallon, cup)");
    print("4. Suhu (celcius, fahrenheit, kelvin)");
    print("0. Keluar");

    // Meminta user memilih kategori dan mengonversi input String ke int
    stdout.write("Pilih kategori (1-0): ");
    int pilihan = int.parse(stdin.readLineSync()!);

    if (pilihan == 0) {
      print("Terima kasih!");
      break;
    }

    // Meminta user memasukkan nilai yang akan dikonversi
    stdout.write("Masukkan nilai: ");
    double value = double.parse(stdin.readLineSync()!);// Konversi String ke double

    // Validasi nilai negatif untuk panjang, massa, dan volume
    // Suhu boleh negatif, sehingga dikecualikan dengan pilihan != 4
    if (value < 0 && pilihan != 4) {
      print("Error: Nilai tidak boleh negatif!");
      return;
    }

    // Meminta input unit asal
    stdout.write("Dari unit: ");
    String from = stdin.readLineSync()!;

    // Meminta input unit tujuan
    stdout.write("Ke unit: ");
    String to = stdin.readLineSync()!;

    double result; // Variabel untuk menyimpan hasil konversi

    try {
      // Pemilihan kategori untuk memanggil fungsi konversi yang sesuai
      switch (pilihan) {
        case 1:
          // Konversi panjang menggunakan Map lengthUnits
          result = convert (value, from, to, lengthUnits);
          break;
        case 2:
          // Konversi massa menggunakan Map massUnits
          result = convert (value, from, to, massUnits);
          break;
        case 3:
          // Konversi volume menggunakan Map volumeUnits
          result = convert (value, from, to, volumeUnits);
          break;
        case 4:
          // Konversi suhu menggunakan fungsi khusus convertTemperature
          result = convertTemperature(value, from, to);
          break;
        default:
        // Jika pilihan kategori tidak valid
          print("Kategori tidak valid!");
          return;
      }

      // Menampilkan hasil konversi dengan format 4 angka di belakang koma
      print("\n=== HASIL KONVERSI ===");
      print("$value $from = ${result.toStringAsFixed(4)} $to");

    } catch (e) {
      // Menangani error jika terjadi kesalahan saat konversi
      print("Terjadi kesalahan: ${e.toString()}");
    }
    }
  }

