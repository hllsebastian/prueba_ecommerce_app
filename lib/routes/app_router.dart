// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_ecommerce_app/domain/models/product_model.dart';
import 'package:prueba_ecommerce_app/presentation/screens/cart_screen.dart';
import 'package:prueba_ecommerce_app/presentation/screens/home_screen.dart';
import 'package:prueba_ecommerce_app/presentation/screens/product_detail_screen.dart';
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
      GoRoute(
        path: RoutePaths.productId,
        pageBuilder: (context, state) {
          final product = state.extra as Product;
          final id = product.id ?? int.parse(state.pathParameters['id']!);
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: Duration(milliseconds: 600),
            child: ProductDetailScreen(product: product, productId: id),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
    ],
  );
}

class RoutePaths {
  static const String home = '/';
  static const String productList = '/products/:category';
  static const String cart = '/cart';
  static const String productId = '/prouduct/:id';
}
