// Mengimpor fungsi convertCurrency dari file currency_convert.dart
import 'package:dart_week2/currency_convert.dart';

// Mengimpor library untuk input/output di terminal
import 'dart:io';

// currency_convert di bin untuk melakukan konversi mata uang.
// Program akan:
// 1. Meminta jumlah uang
// 2. Meminta mata uang asal
// 3. Meminta mata uang tujuan
// 4. Menghitung hasil konversi
// 5. Menampilkan hasilnya

void main() {
  // Nilai tukar terhadap IDR (sebagai mata uang dasar)
  const double usdRate = 16000 ;
  const double eurRate = 20000;
  const double idrRate = 1;

  // Meminta input jumlah uang dari user,
  // kemudian mengubah input String menjadi tipe data double
  stdout.write("Masukkan jumlah uang: ");
  double amount = double.parse(stdin.readLineSync()!);

  // Meminta input mata uang asal dan mengubah ke huruf kapital
  // agar ketika user menginputkan seperti usd tetap valid
  stdout.write("Masukkan Mata Uang Asal (USD/EUR/IDR): ");
  String fromCurrency = stdin.readLineSync()!.toUpperCase();

  // Meminta input mata uang tujuan dan mengubah ke huruf kapital
  stdout.write("Masukkan Mata Uang Tujuan (USD/EUR/IDR): ");
  String toCurrency = stdin.readLineSync()!.toUpperCase();

  double fromRate, toRate;

  // Menentukan nilai tukar mata uang asal sesuai dengan input dari user
  if (fromCurrency == "USD") {
    fromRate = usdRate;
  } else if (fromCurrency == "EUR") {
    fromRate = eurRate;
  } else if (fromCurrency == "IDR") {
    fromRate = idrRate;
  } else {
    // Jika mata uang tidak dikenali
    print("Mata uang asal tidak valid!");
    return; //menghentikan program
  }

  // Menentukan nilai tukar mata uang tujuan
  if (toCurrency == "USD") {
    toRate = usdRate;
  } else if (toCurrency == "EUR") {
    toRate = eurRate;
  } else if (toCurrency == "IDR") {
    toRate = idrRate;
  } else {
    print("Mata uang tujuan tidak valid!");
    return;
  }

  // Memanggil fungsi konversi dari file currency_convert.dart
  double result = convertCurrency(amount, fromRate, toRate);

  // Menampilkan hasil konversi dengan 2 angka di belakang koma
  print("\nHasil konversi:");
  print("$amount $fromCurrency = ${result.toStringAsFixed(2)} $toCurrency");
}
