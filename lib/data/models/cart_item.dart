class CartItem {
  // ID unik produk
  final int id;

  // Nama produk
  final String nama;

  // Harga satu produk
  final int harga;

  // URL/path gambar produk
  final String gambar;

  // Jumlah produk di dalam keranjang
  int jumlah;

  // Constructor
  CartItem({
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambar,
    required this.jumlah,
  });
}