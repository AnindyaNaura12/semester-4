// Fungsi untuk menghitung total belanja setelah diskon
// Mengembalikan total belanja setelah diskon (double)
double hitungDiskon(double totalBelanja, int jumlahBarang, bool isMember) {

  // Menentukan jika pelanggan memenuhi syarat diskon
  // Menerapkan operator logika '&&' → memastikan kedua kondisi terpenuhi
  bool dapatDiskon = totalBelanja >= 100000 && jumlahBarang > 3;

  // Menerapkan operator ternary '? :' 
  // jika dapatDiskon true, diskon = 10% dari totalBelanja
  // jika false, diskon = 0
  double diskon = dapatDiskon ? totalBelanja * 0.1 : 0;

  // Jika pelanggan adalah member, ditambahkan 50% diskon tambahan
  if (isMember) {
    diskon += totalBelanja * 0.5;
  }

  // Mengembalikan total akhir setelah dikurangi diskon
  return totalBelanja - diskon;
}

// Fungsi untuk menambah jumlah barang sebanyak 1
int tambahBarang(int jumlahBarang) {
  // Menerapkan operator increment '++' untuk menambahkan 1 ke jumlahBarang
  jumlahBarang++;
  return jumlahBarang;
}

// Fungsi untuk mengecek status member berdasarkan kode
// statusKode : 1 = member, 0 = non-member
bool cekStatusMember(int statusKode) {
  // Operator bitwise '&', untuk memeriksa bit paling kanan
  // Jika hasilnya 1, berarti member
  return (statusKode & 1) == 1;
}

// Fungsi untuk validasi tipe data total belanja
void validasiTransaksi(dynamic totalBelanja) {
  print("\n=== Validasi Transaksi ===");
  // Operator 'is' digunakan untuk memeriksa tipe data
  if (totalBelanja is double) {
    print("Tipe data total belanja valid (double)");
  } else {
    print("Tipe data tidak valid");
  }
}
