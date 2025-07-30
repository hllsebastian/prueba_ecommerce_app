// import 'dart:convert';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:http/http.dart' as http;

// import 'package:prueba_ecommerce_app/data/repositories/category_repository.dart';
// import 'package:prueba_ecommerce_app/presentation/providers/category_provider.dart';
// import '../mocks/mock_http_client.mocks.dart';

// void main() {
//   group('CategoryProvider', () {
//     late CategoryProvider provider;
//     late CategoryRepository repository;
//     late MockClient mockClient;

//     setUp(() {
//       mockClient = MockClient();
//       repository = CategoryRepository()
//         ..client = mockClient; // Igual que ProductRepository
//       provider = CategoryProvider(repository);
//     });

//     test('Debe cargar categorías correctamente', () async {
//       // Arrange
//       final mockResponse = jsonEncode(["electronics", "jewelery"]);

//       when(
//         mockClient.get(
//           Uri.parse('https://fakestoreapi.com/products/categories'),
//         ),
//       ).thenAnswer((_) async => http.Response(mockResponse, 200));

//       // Act
//       await provider.loadCategories();

//       // Assert
//       expect(provider.categories.length, 2);
//       expect(provider.categories.first, 'electronics');
//       expect(provider.loading, false);
//     });
//   });
// }
