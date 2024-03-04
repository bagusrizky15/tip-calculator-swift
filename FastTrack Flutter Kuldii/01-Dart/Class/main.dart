import './pakaian.dart';
void main(List<String> args) {
  var pakaian = Pakaian(jenis: "polo", ukuran: "L", warna: "Putih");
  print("Jenis: ${pakaian.jenis}, Ukuran: ${pakaian.ukuran()}");

  print("ganti ukuran ===================");
  pakaian.gantiUkuran("XXL");
  print("Jenis: ${pakaian.jenis}, Ukuran: ${pakaian.ukuran()}");
}

