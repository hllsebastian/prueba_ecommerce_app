import 'package:go_router/go_router.dart';
import 'package:prueba_ecommerce_app/presentation/screens/cart_screen.dart';
import 'package:prueba_ecommerce_app/presentation/screens/home_screen.dart';
import 'package:prueba_ecommerce_app/presentation/screens/product_list_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RoutePaths.home,
    routes: [
      GoRoute(
        path: RoutePaths.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RoutePaths.productList,
        builder: (context, state) {
          final category = state.pathParameters['category']!;
          return ProductListScreen(category: category);
        },
      ),
      GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
    ],
  );
}

class RoutePaths {
  static const String home = '/';
  static const String productList = '/products/:category';
  static const String cart = '/cart';
}
