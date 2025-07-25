import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba_ecommerce_app/domain/models/product_model.dart';

class ProductRepository {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> fetchByCategory(String category) async {
    final response = await http.get(
      Uri.parse('$baseUrl/products/category/$category'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar productos');
    }
  }
}
