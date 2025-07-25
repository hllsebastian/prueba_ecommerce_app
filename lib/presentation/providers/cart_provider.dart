import 'package:flutter/material.dart';
import '../../domain/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final Map<int, int> _normalCart = {};
  final Map<int, int> _expressCart = {};

  bool _isExpress = false;

  bool get isExpress => _isExpress;
  Map<int, int> get currentCart => _isExpress ? _expressCart : _normalCart;

  void toggleExpress(bool value) {
    _isExpress = value;
    notifyListeners();
  }

  void addProduct(Product product) {
    final cart = currentCart;
    cart[product.id] = (cart[product.id] ?? 0) + 1;
    notifyListeners();
  }

  void removeProduct(Product product) {
    final cart = currentCart;
    if (cart.containsKey(product.id)) {
      if (cart[product.id]! > 1) {
        cart[product.id] = cart[product.id]! - 1;
      } else {
        cart.remove(product.id);
      }
      notifyListeners();
    }
  }

  int getQuantity(Product product) {
    return currentCart[product.id] ?? 0;
  }

  int get totalItems => currentCart.values.fold(0, (sum, qty) => sum + qty);
}
