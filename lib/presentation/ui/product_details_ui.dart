import 'package:flutter/material.dart';
import 'package:products/domain/entity/products_api.dart';
import 'package:products/extentitons/uppercase.dart';

class ProductDetailsUI extends StatelessWidget {
  final ProductsApi product;

  const ProductDetailsUI({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String productImg = product.image ?? '';
    String title = product.title ?? '';
    String category = product.category?.capitalize() ?? '';
    String price = product.price?.toString() ?? '';
    int rating = product.rating?.count ?? 0;
    double rate = product.rating?.rate ?? 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              productImg,
              width: double.infinity,
              height: 280,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(category),
            Text('Price: $price'),
            Text('Rate count: $rating'),
            Text('Rate: $rate')
          ],
        ),
      ),
    );
  }
}
