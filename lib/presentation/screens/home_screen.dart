import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ecommerce_app/presentation/providers/category_provider.dart';
import 'package:prueba_ecommerce_app/presentation/widgets/custom_app_bar.dart';
import '../providers/cart_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<CategoryProvider>().loadCategories());
  }

  bool _isExpressTime() {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day, 10);
    final end = DateTime(now.year, now.month, now.day, 16);
    return now.isAfter(start) && now.isBefore(end);
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<CategoryProvider>();
    final cartProvider = Provider.of<CartProvider>(context);
    final categories = categoryProvider.categories;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          if (_isExpressTime())
            SwitchListTile(
              title: const Text('Activar experiencia express'),
              value: cartProvider.isExpress,
              onChanged: (val) => cartProvider.toggleExpress(val),
            ),
          if (categoryProvider.loading)
            const Center(child: CircularProgressIndicator())
          else
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return ListTile(
                    title: Text(category),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => context.push('/products/$category'),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
