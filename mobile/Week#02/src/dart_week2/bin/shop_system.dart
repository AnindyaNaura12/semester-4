// Mengimpor file shop_system.dart dengan alias week2_shop_system
// agar fungsi di dalamnya dipanggil menggunakan prefix week2_shop_system
import 'package:dart_week2/shop_system.dart' as week2_shop_system;

// Mengimpor library untuk input dan output terminal
import 'dart:io';

void main() {
  print("=== Sistem Diskon Toko ===");

  // Meminta input nama pembeli
  stdout.write("Nama Pembeli:");
  String? namaInput = stdin.readLineSync();

  // Jika input null, maka otomatis diisi "Guest"
  // menerapkan operator '??' --> null-coalescing
  String nama = namaInput ?? "Guest";

  // Meminta total belanja dan mengubahnya ke tipe double
  stdout.write("Total Belanja: ");
  double totalBelanja = double.parse(stdin.readLineSync()!);

  // Meminta jumlah barang dan mengubahnya ke tipe int
  stdout.write("Jumlah Barang: ");
  int jumlahBarang = int.parse(stdin.readLineSync()!);

  // Opsi untuk menambahkan 1 barang 
  stdout.write("Tambah 1 barang lagi? (y/n): ");
  String? tambah = stdin.readLineSync();

  // Jika user memilih "y" atau "Y", jumlah barang ditambah 1
  // Penerapan operator increment (+1)
  if (tambah == "y" || tambah == "Y") {
    jumlahBarang = week2_shop_system.tambahBarang(jumlahBarang);
    print("Jumlah barang setelah ditambah: $jumlahBarang");
  }

  // Meminta status member (1 = Ya, 0 = Tidak) dan diubah ke tipe int
  stdout.write("Apakah Member? (1 = Ya, 0 = Tidak): ");
  int statusKode = int.parse(stdin.readLineSync()!);

  // Mengubah kode status menjadi boolean (true/false)
  bool isMember = week2_shop_system.cekStatusMember(statusKode);

  // Menghitung total akhir setelah diskon dengan function hitungDiskon
  double totalAkhir = week2_shop_system.hitungDiskon(totalBelanja, jumlahBarang, isMember);

  // Menampilkan struk pembelian
  print("\n=== STRUK PEMBELIAN ===");
  print("Nama           : $nama");
  // Operator ternary '? :' → mengecek kondisi isMember, jika true tampil "Ya", jika false tampil "Tidak"
  print("Status Member  : ${isMember ? "Ya" : "Tidak"}");
  print("Jumlah Barang  : $jumlahBarang");
  print("Total Akhir    : ${totalAkhir.toStringAsFixed(2)}");

  // Melakukan validasi transaksi dengan memanggil function validasiTransaksi
  week2_shop_system.validasiTransaksi(totalBelanja);

  print("\nTerima kasih sudah berbelanja!");
}