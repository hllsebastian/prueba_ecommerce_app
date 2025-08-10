import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_ecommerce_app/domain/models/product_model.dart';
import 'package:prueba_ecommerce_app/presentation/providers/cart_provider.dart';

void main() {
  group('CartProvider', () {
    late CartProvider cartProvider;
    final sampleProduct = Product(
      id: 1,
      title: 'Sample Product',
      price: 9.99,
      description: 'Sample description',
      category: 'category',
      image: 'https://example.com/image.png',
    );

    setUp(() {
      cartProvider = CartProvider();
    });

    test('Debe iniciar con el carrito vacío', () {
      expect(cartProvider.totalItems, 0);
      expect(cartProvider.currentCart.isEmpty, true);
    });

    test('Debe agregar un producto al carrito normal', () {
      cartProvider.addProduct(sampleProduct);
      expect(cartProvider.totalItems, 1);
      expect(cartProvider.getQuantity(sampleProduct), 1);
    });

    test('Debe incrementar la cantidad de un producto', () {
      cartProvider.addProduct(sampleProduct);
      cartProvider.addProduct(sampleProduct);
      expect(cartProvider.getQuantity(sampleProduct), 2);
    });

    test('Debe eliminar un producto del carrito', () {
      cartProvider.addProduct(sampleProduct);
      cartProvider.removeProduct(sampleProduct);
      expect(cartProvider.totalItems, 0);
    });

    test('Debe manejar carrito express de forma independiente', () {
      cartProvider.addProduct(sampleProduct);
      cartProvider.toggleExpress(true); // Cambiamos a express
      expect(cartProvider.totalItems, 0); // Express inicia vacío
      cartProvider.addProduct(sampleProduct);
      expect(cartProvider.totalItems, 1); // Solo cuenta el express
    });
  });
}
