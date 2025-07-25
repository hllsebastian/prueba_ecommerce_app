import 'package:flutter/material.dart';
import 'package:prueba_ecommerce_app/data/category_repository.dart';

class CategoryProvider with ChangeNotifier {
  final CategoryRepository repository;

  CategoryProvider(this.repository);

  List<String> _categories = [];
  bool _loading = false;

  List<String> get categories => _categories;
  bool get loading => _loading;

  Future<void> loadCategories() async {
    _loading = true;
    notifyListeners();

    try {
      _categories = await repository.fetchCategories();
    } catch (_) {
      _categories = [];
    }

    _loading = false;
    notifyListeners();
  }
}
