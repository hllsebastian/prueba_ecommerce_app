import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba_ecommerce_app/core/loggin/app_logger.dart';
import 'package:prueba_ecommerce_app/data/api/endpoints.dart';
import 'package:prueba_ecommerce_app/domain/models/product_model.dart';

class ProductRepository {
  Future<List<Product>> fetchByCategory(String category) async {
    final url = Endpoints.productsByCategory(category);
    AppLogger.info("Fetching products from API: $url");
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final products = data.map((json) => Product.fromJson(json)).toList();

        AppLogger.debug(
          "Fetched ${products.length} products for category '$category'.",
        );
        return products;
      } else {
        AppLogger.warning("Request failed with status: ${response.statusCode}");
        throw Exception(
          'Error ${response.statusCode}: No se pudo cargar productos',
        );
      }
    } catch (e, st) {
      AppLogger.error(
        "Exception occurred while fetching products for category '$category'",
        e,
        st,
      );
      rethrow;
    }
  }
}
