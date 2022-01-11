import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/produc.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  static final _numberFormat = NumberFormat.simpleCurrency();
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
      header: Text(_numberFormat.format(product.price)),
      footer: GridTileBar(
        backgroundColor: Colors.black38,
        leading: IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {},
        ),
        trailing: IconButton(
          icon: const Icon(Icons.shopping_bag),
          onPressed: () {},
        ),
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
