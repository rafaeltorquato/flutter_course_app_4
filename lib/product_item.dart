import 'package:flutter/material.dart';
import 'package:flutter_course_app_4/screens/product_detail_screen.dart';
import 'package:intl/intl.dart';

import '../models/produc.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  static final _numberFormat = NumberFormat.simpleCurrency();
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  showDetails(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
                product: product,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () => showDetails(context),
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
              icon: Icon(product.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border_outlined),
              onPressed: () {},
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_bag),
              onPressed: () {},
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
  }
}
