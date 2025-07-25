import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ecommerce_app/domain/models/product_model.dart';
import 'package:prueba_ecommerce_app/presentation/providers/product_provider.dart';
import 'package:prueba_ecommerce_app/presentation/widgets/custom_app_bar.dart';
import 'package:prueba_ecommerce_app/presentation/widgets/product_grid.dart';

class ProductListScreen extends StatefulWidget {
  final String category;

  const ProductListScreen({super.key, required this.category});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProductProvider>().loadProductsByCategory(widget.category);
    });
    // fetchProductsByCategory(widget.category);
  }

  // Future<void> fetchProductsByCategory(String category) async {
  //   final response = await http.get(
  //     Uri.parse('https://fakestoreapi.com/products/category/$category'),
  //   );
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body) as List;
  //     setState(() {
  //       products = data.map((json) => Product.fromJson(json)).toList();
  //       loading = false;
  //     });
  //   }
  // }

  String capitalizeWords(String input) {
    return input
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: CustomAppBar(categoryTitle: widget.category),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    capitalizeWords(widget.category),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(child: ProductGrid(products: provider.products)),
              ],
            ),
    );
  }
}
