class Endpoints {
  static const String base = 'https://fakestoreapi.com';

  static const String categories = '$base/products/categories';

  static String productsByCategory(String category) =>
      '$base/products/category/$category';

  // TODO: enable this endpoint when product details are needed
  // static String productById(int id) => '$base/products/$id';
}
