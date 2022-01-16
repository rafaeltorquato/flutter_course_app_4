import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../utils/app_colors.dart';

class CartBadge extends StatelessWidget {
  final VoidCallback onPressed;
  const CartBadge({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.shopping_cart),
        ),
        Positioned(
            top: 10,
            right: 3,
            child: Container(
              width: 16,
              height: 16,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(10)),
              child: Consumer<Cart>(
                builder: (ctx, cart, child) => Text(
                  cart.totalProducts.toString(),
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ))
      ],
    );
  }
}
