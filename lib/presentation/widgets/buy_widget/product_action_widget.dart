import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ecommerce_app/domain/models/product_model.dart';
import 'package:prueba_ecommerce_app/presentation/providers/cart_provider.dart';
import 'package:prueba_ecommerce_app/presentation/widgets/buy_widget/express_cart_control.dart';

class ProductActionWidget extends StatefulWidget {
  final Product product;

  const ProductActionWidget({super.key, required this.product});

  @override
  State<ProductActionWidget> createState() => _ProductActionWidgetState();
}

class _ProductActionWidgetState extends State<ProductActionWidget> {
  bool _showControls = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final cart = context.watch<CartProvider>();
    final isExpress = cart.isExpress;
    final quantity = cart.getQuantity(product);

    // if express mode is inactive
    if (!isExpress) {
      return quantity == 0
          ? ElevatedButton(
              onPressed: () => cart.addProduct(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                minimumSize: const Size(80, 32),
              ),
              child: const Text('Agregar'),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => cart.removeProduct(product),
                ),
                Text(quantity.toString()),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => cart.addProduct(product),
                ),
              ],
            );
    }

    // if express mode is active and product quantity is greater than 0
    if (_showControls || quantity > 0) {
      return ExpressCartControls(
        quantity: quantity,
        onAdd: () => cart.addProduct(product),
        onRemove: () {
          cart.removeProduct(product);
          if (cart.getQuantity(product) == 0) {
            setState(() => _showControls = false);
          }
        },
      );
    }

    // if express mode is inactive and product quantity is 0
    return ElevatedButton.icon(
      onPressed: () {
        cart.addProduct(product);
        setState(() => _showControls = true);
      },
      icon: const Icon(Icons.shopping_cart_outlined),
      label: const Text("Comprar"),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF039BE5),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}
