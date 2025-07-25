import 'package:flutter/material.dart';
import 'package:prueba_ecommerce_app/data/product_repository.dart';
import 'package:prueba_ecommerce_app/domain/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final ProductRepository repository;

  ProductProvider(this.repository);

  List<Product> _products = [];
  bool _loading = false;

  List<Product> get products => _products;
  bool get loading => _loading;

  Future<void> loadProductsByCategory(String category) async {
    _loading = true;
    notifyListeners();

    try {
      _products = await repository.fetchByCategory(category);
    } catch (e) {
      _products = [];
    }

    _loading = false;
    notifyListeners();
  }
}
