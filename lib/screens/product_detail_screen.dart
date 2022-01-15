import 'package:flutter/material.dart';
import 'package:flutter_course_app_4/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeWithArgs = '/product-detail-screen';
  static const String argProduct = 'product';

  static ProductDetailScreen withArgs(Map args) {
    return ProductDetailScreen(
      product: args[argProduct] as Product,
    );
  }

  final Product product;

  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
