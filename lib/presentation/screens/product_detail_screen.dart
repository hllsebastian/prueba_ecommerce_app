import 'package:flutter/material.dart';
import 'package:prueba_ecommerce_app/domain/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final int productId;
  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Hero(
              tag: 'product-${product.id}',
              child: Image.asset(
                'assets/images/no_image.png',
                width: 110,
                height: 110,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/images/no_image.png',
                  width: 110,
                  height: 110,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(product.title, style: Theme.of(context).textTheme.titleLarge),
          // ... resto del contenido
        ],
      ),
    );
  }
}
