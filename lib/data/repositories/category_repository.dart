import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba_ecommerce_app/data/api/endpoints.dart';

class CategoryRepository {
  Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse(Endpoints.categories));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<String>();
    } else {
      throw Exception('Error al cargar categorías');
    }
  }
}
