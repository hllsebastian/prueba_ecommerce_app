import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba_ecommerce_app/core/loggin/app_logger.dart';
import 'package:prueba_ecommerce_app/data/api/endpoints.dart';

class CategoryRepository {
  /// Obtiene el listado de categorías desde la API.
  Future<List<String>> fetchCategories() async {
    final url = Endpoints.categories;
    AppLogger.info("Fetching product categories from API: $url");

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final categories = data.cast<String>();

        AppLogger.debug("Fetched ${categories.length} categories.");
        return categories;
      } else {
        AppLogger.warning("Request failed with status: ${response.statusCode}");
        throw Exception(
          'Error ${response.statusCode}: No se pudieron cargar las categorías',
        );
      }
    } catch (e, st) {
      AppLogger.error("Exception occurred while fetching categories", e, st);
      rethrow;
    }
  }
}
