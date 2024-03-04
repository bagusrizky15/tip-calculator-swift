class Pakaian{
  // atribut
  String? jenis;
  String? _ukuran;
  String? warna;

  // constructor
  Pakaian({this.jenis, ukuran, this.warna});

  // method
  void gantiUkuran(String ukuran){
    _ukuran = ukuran;
  }

  String? ukuran(){
    return _ukuran;
  }
}