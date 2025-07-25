import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ecommerce_app/data/repositories/category_repository.dart';
import 'package:prueba_ecommerce_app/data/repositories/product_repository.dart';
import 'package:prueba_ecommerce_app/presentation/providers/category_provider.dart';
import 'package:prueba_ecommerce_app/presentation/providers/product_provider.dart';
import 'routes/app_router.dart';
import 'presentation/providers/cart_provider.dart';

void main() {
  runApp(const PruebaEcommerceApp());
}

class PruebaEcommerceApp extends StatelessWidget {
  const PruebaEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(CategoryRepository()),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(ProductRepository()),
        ),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Éxito Prueba App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
