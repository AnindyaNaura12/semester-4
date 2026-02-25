// Fungsi untuk mengonversi mata uang
// Mengembalikan hasil konversi dalam bentuk double
double convertCurrency(double amount, double fromRate, double toRate) {
  // Mengubah jumlah uang ke dalam nilai Rupiah (IDR) terlebih dahulu
  double amountInIDR = amount * fromRate;

  // Mengonversi dari IDR ke mata uang tujuan
  return amountInIDR / toRate;
}