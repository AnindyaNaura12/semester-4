void main() {
  String nama = "Anindya N.P.A";
  String nim = "244107060051";

  //3 digit terakhir NIM
  double nilaiUnikNim = 051;

  //list harga barang
  List<double> hargaBarang = [
    56000.50,
    70500.25,
    33000.75,
    45000.00,
    29000.50
  ];

  //menambahkan nilai unik NIM ke dalam list
  hargaBarang.add(nilaiUnikNim);

  //fungsi hitungTotal
  double totalAwal = hitungTotal(hargaBarang);

  //null safety
  String? pesanDiskon;

  double diskon = 0;
  
  //control flow(percabangan) diskon
  if (totalAwal > 200000) {
    diskon = totalAwal * 0.10;
    pesanDiskon = "Diskon 10% (Total belanja di atas Rp200.000)";
  } else if (totalAwal >= 100000 && totalAwal <= 200000) {
    diskon = totalAwal * 0.05;
    pesanDiskon = "Diskon 5% (Total belanja Rp100.000 - Rp200.000)";
  } else {
    diskon = 0;
    pesanDiskon = "Tidak ada diskon (Total belanja di bawah Rp100.000)";
  }

  double totalAkhir = totalAwal - diskon;

  //output
  print("===== SISTEM DISKON TOKO =====");
  print("Nama : $nama");
  print("NIM  : $nim");
  print("Total Belanja Awal : Rp $totalAwal");
  print("Keterangan Diskon : ${pesanDiskon!}");
  print("Besar Diskon : Rp $diskon");
  print("Total Akhir : Rp $totalAkhir");

}

//function menghitung total
double hitungTotal(List<double> listHarga) {
  double total = 0;

  for (double item in listHarga) {
    total += item;
  }

  return total;
}
