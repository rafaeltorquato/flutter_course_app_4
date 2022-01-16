import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/app_colors.dart';
import '../widgets/cart_item.dart';
import '../providers/cart.dart';
import '../utils/format_utils.dart';

class CartScreen extends StatelessWidget {
  static const String route = '/cart';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (ctx, cart, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Your Cart'),
        ),
        body: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 10),
                    Chip(
                      label: Text(
                        FormatUtils.currency(cart.totalAmount),
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: AppColors.primary,
                    ),
                    ElevatedButton(
                      onPressed: cart.totalProducts > 0 ? () {} : null,
                      child: const Text('ORDER NOW'),
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.secondary),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              cart.totalProducts == 0 ? 'Your cart is empty' : 'Products',
              style: const TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.totalProducts,
                itemBuilder: (ctx, idx) {
                  ProductInCart productInCart = cart.getItemAt(idx);
                  return CartItem(
                    onRemove: (productInCart) => cart.removeItem(productInCart),
                    key: ValueKey(productInCart.id),
                    productInCart: productInCart,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
