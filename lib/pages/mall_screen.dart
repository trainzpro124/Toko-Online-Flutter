import 'package:flutter/material.dart';
import 'package:mysample/data/dummy/dummy_produk.dart';
import 'package:mysample/data/models/model_produk.dart';

import '../widgets/my_app_bar.dart';



class MallScreen extends StatelessWidget {
  MallScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),

      // =========================
      // BODY
      // =========================
      body: GridView.builder(
        // padding: const EdgeInsets.only(bottom: 120),
        // padding: const EdgeInsets.only(bottom: 100),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // menentukan jumlah item
        itemCount: products.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // menentukan total kolom
          crossAxisCount: 2,
          // menentukan jarak samping horizontal
          crossAxisSpacing: 12,
          // menentukan jarak atas dan bawah
          mainAxisSpacing: 12,
          // menentukan rasio antar item
          // childAspectRatio: 0.68,
        ),

        // untuk membuat konten tiam item
        // index menyimpan posisi item
        itemBuilder: (context, index) {
          final product = products[index];
          // masukkan produk ke dalam item sebagai argument
          return _productItemView(product);
        },
      ),
    );
  }

  // =========================
  // Product
  // =========================

  Widget _productItemView(Product product) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar produk
          Expanded(
            child: Image.network(
              product.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Informasi produk
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  'Rp ${product.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 6),

                const Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    SizedBox(width: 4),
                    Text('4.8'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}