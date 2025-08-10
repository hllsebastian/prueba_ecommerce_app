import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'package:prueba_ecommerce_app/data/repositories/product_repository.dart';
import 'package:prueba_ecommerce_app/presentation/providers/product_provider.dart';
import '../mocks/mock_http_client.mocks.dart';

void main() {
  group('ProductProvider', () {
    late ProductProvider provider;
    late ProductRepository repository;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      repository = ProductRepository()
        ..client = mockClient; // Modifica tu repo para aceptar client opcional
      provider = ProductProvider(repository);
    });

    test('Debe cargar productos correctamente', () async {
      // Arrange
      final mockResponse = jsonEncode([
        {
          "id": 1,
          "title": "Test Product",
          "price": 10.0,
          "description": "Test desc",
          "category": "electronics",
          "image": "https://example.com/image.png",
        },
      ]);

      when(
        mockClient.get(
          Uri.parse('https://fakestoreapi.com/products/category/electronics'),
        ),
      ).thenAnswer((_) async => http.Response(mockResponse, 200));

      // Act
      await provider.loadProductsByCategory('electronics');

      // Assert
      expect(provider.products.length, 1);
      expect(provider.products.first.title, 'Test Product');
      expect(provider.loading, false);
    });
  });
}
