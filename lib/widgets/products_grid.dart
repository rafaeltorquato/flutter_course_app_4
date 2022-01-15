import 'package:flutter/material.dart';
import 'package:flutter_course_app_4/providers/products.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import '../providers/product.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(builder: (ctx, provider, child) {
      List<Product> products = provider.filterAppliedItems;
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
            key: ValueKey(products[idx].id),
            value: products[idx],
            child: const ProductItem(),
          );
        },
      );
    });
  }
}
