import 'package:flutter/material.dart';
import 'package:prueba_ecommerce_app/presentation/widgets/cart_icon_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.categoryTitle});
  final String? categoryTitle;

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    return AppBar(
      backgroundColor: Colors.yellow,
      toolbarHeight: 80,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                if (canPop)
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                const Expanded(child: _SearchProductContent()),
                const SizedBox(width: 12),
                if (canPop) const CartIconWithBadge(),
                if (!canPop)
                  const Icon(
                    Icons.person_2_outlined,
                    size: 30,
                    color: Colors.black87,
                  ),
              ],
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: const _UserLocation(),
      ),
    );
  }
}

class _UserLocation extends StatelessWidget {
  const _UserLocation();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: ColoredBox(
        color: Colors.black87,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              SizedBox(width: 20),
              Icon(Icons.location_on, size: 16, color: Colors.yellow),
              SizedBox(width: 8),
              Text(
                'Como quieres recibir tu pedido?',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              SizedBox(width: 8),
              Icon(Icons.edit, size: 16, color: Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchProductContent extends StatelessWidget {
  const _SearchProductContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.black87),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Busca en tu app',
                hintStyle: TextStyle(color: Colors.black87),
                border: InputBorder.none,
                isDense: true,
              ),
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
