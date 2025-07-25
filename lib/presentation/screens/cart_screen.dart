import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../../domain/models/product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Map<int, Product> productDetails = {};

  @override
  void initState() {
    super.initState();
    fetchCartProducts();
  }

  Future<void> fetchCartProducts() async {
    final cart = context.read<CartProvider>().currentCart;
    for (final productId in cart.keys) {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/$productId'),
      );
      if (response.statusCode == 200) {
        final product = Product.fromJson(json.decode(response.body));
        setState(() {
          productDetails[productId] = product;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cart = cartProvider.currentCart;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          cartProvider.isExpress ? 'Carrito Express' : 'Carrito Normal',
        ),
      ),
      body: cart.isEmpty
          ? const Center(child: Text('No hay productos en el carrito.'))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final productId = cart.keys.elementAt(index);
                final quantity = cart[productId]!;
                final product = productDetails[productId];

                if (product == null) {
                  return const ListTile(title: Text('Cargando producto...'));
                }

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(product.image, height: 50),
                    title: Text(product.title),
                    subtitle: Text('Cantidad: $quantity'),
                  ),
                );
              },
            ),
    );
  }
}
