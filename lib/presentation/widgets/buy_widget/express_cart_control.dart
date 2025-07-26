import 'package:flutter/material.dart';

class ExpressCartControls extends StatelessWidget {
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ExpressCartControls({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: onRemove,
            splashRadius: 20,
          ),
          Text(
            '$quantity und',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: onAdd,
            splashRadius: 20,
          ),
        ],
      ),
    );
  }
}
