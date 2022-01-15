import 'package:flutter/material.dart';
import 'package:flutter_course_app_4/providers/products.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import '../providers/product.dart';

class ProductsGrid extends StatelessWidget {
  final bool showOnlyFavorites;
  const ProductsGrid({Key? key, required this.showOnlyFavorites})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productsProvider = Provider.of<Products>(context);
    List<Product> products = showOnlyFavorites
        ? productsProvider.favoritesItems
        : productsProvider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (ctx, idx) {
        return ChangeNotifierProvider.value(
          value: products[idx],
          child: ProductItem(
            key: ValueKey(products[idx].id),
          ),
        );
      },
    );
  }
}
