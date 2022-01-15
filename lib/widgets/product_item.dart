import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../providers/cart.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  static final _numberFormat = NumberFormat.simpleCurrency();
  const ProductItem({Key? key}) : super(key: key);

  showDetails(BuildContext context, Product product) {
    Navigator.pushNamed(context, ProductDetailScreen.routeWithArgs,
        arguments: {ProductDetailScreen.argProduct: product});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Product>(
      builder: (ctx, product, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: () => showDetails(context, product),
            child: GridTile(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
              header: Text(
                _numberFormat.format(product.price),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                leading: IconButton(
                  icon: AnimatedCrossFade(
                    crossFadeState: product.isFavorite
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 200),
                    firstChild: const Icon(Icons.favorite),
                    secondChild: const Icon(Icons.favorite_outline),
                  ),
                  onPressed: () {
                    product.toggleFavorite();
                    Provider.of<Products>(context, listen: false).itemChanged();
                  },
                ),
                trailing: IconButton(
                  icon: Consumer<Cart>(
                    builder: (ctx, cart, child) => AnimatedCrossFade(
                      crossFadeState: cart.containsProduct(product)
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 200),
                      firstChild: const Icon(Icons.shopping_cart),
                      secondChild: const Icon(Icons.shopping_cart_outlined),
                    ),
                  ),
                  onPressed: () {
                    Provider.of<Cart>(context, listen: false)
                        .addProduct(product);
                  },
                ),
                title: Text(
                  product.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
