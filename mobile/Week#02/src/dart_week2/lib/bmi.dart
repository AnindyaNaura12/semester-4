// Fungsi untuk menghitung nilai BMI (Body Mass Index)
// Mengembalikan nilai BMI dalam bentuk double
double hitungBMI(double berat, double tinggiMeter) {
  // Rumus BMI = berat badan (kg) / (tinggi badan (m) × tinggi badan (m))
  double bmi = berat / (tinggiMeter * tinggiMeter);

  // Mengembalikan hasil perhitungan BMI
  return bmi;
}

// Fungsi untuk menentukan kategori BMI berdasarkan nilai BMI
// Mengembalikan kategori dalam bentuk String
String kategoriBMI(double bmi) {

  // Jika BMI kurang dari 18.5 --> Kurus
  if (bmi < 18.5) {
    return "Kurus";

  // Jika BMI antara 18.5 sampai kurang dari 25 --> Normal
  } else if (bmi < 25) {
    return "Normal";

  // Jika BMI antara 25 sampai kurang dari 30 --> Overweight
  } else if (bmi < 30) {
    return "Overweight";

  // Jika BMI 30 atau lebih --> Obesitas
  } else {
    return "Obesitas";
  }
}