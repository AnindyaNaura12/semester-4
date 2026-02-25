// PANJANG (basis: meter)
// Map menyimpan faktor konversi setiap satuan panjang ke satuan dasar "meter"
final Map<String, double> lengthUnits = {
  "meter": 1,
  "kilometer": 1000,
  "centimeter": 0.01,
  "millimeter": 0.001,
  "mile": 1609.34,
};

// MASSA (basis: kilogram)
// Map menyimpan faktor konversi setiap satuan massa ke satuan dasar "kilogram"
final Map<String, double> massUnits = {
  "kilogram": 1,
  "gram": 0.001,
  "milligram": 0.000001,
  "ton": 1000,
  "pound": 0.453592,
};

// VOLUME (basis: liter)
// Map menyimpan faktor konversi setiap satuan volume ke satuan dasar "liter"
final Map<String, double> volumeUnits = {
  "liter": 1,
  "milliliter": 0.001,
  "cubic_meter": 1000,
  "gallon": 3.78541,
  "cup": 0.24,
};

// KONVERSI UMUM (menggunakan Map faktor)
// Fungsi ini mengonversi nilai dari satu unit ke unit lain menggunakan Map faktor konversi
double convert( double value, String from, String to,
  Map<String, double> unitMap) {
    // Konversi ke satuan dasar (basus)
    // operator '!' → memastikan key ada di Map
    double baseValue = value * unitMap[from]!;

    // Konversi dari basis ke satuan tujuan
    return baseValue / unitMap[to]!;
}

// KONVERSI SUHU (tidak bisa pakai Map faktor saja)
// Fungsi ini mengonversi suhu dari satu unit ke unit lain
double convertTemperature(double value, String from, String to) {
    double celsius; // Variabel sementara untuk menyimpan suhu dalam Celsius

    // Ubah nilai dari unit asal ke Celsius
    if (from == "celsius") {
      celsius = value;
    } else if (from == "fahrenheit") {
      celsius = (value - 32) * 5 / 9; // Rumus F --> C
    } else if (from == "kelvin") {
      celsius = value - 273.15; // Rumus K --> C
    } else {
      throw Exception("Unit suhu tidak valid"); // Error jika unit asal tidak dikenali
    }

    // Ubah dari Celsius ke tujuan
    if (to == "celsius") {
      return celsius;
    } else if (to == "fahrenheit") {
      return (celsius * 9 / 5) + 32; // Rumus C --> F
    } else if (to == "kelvin") {
      return celsius + 273.15;  // Rumus C --> K
    } else {
      throw Exception("Unit suhu tidak valid"); // Error jika unit tujuan tidak dikenali
    }
  }