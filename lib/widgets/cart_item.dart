import 'package:flutter/material.dart';
import 'package:flutter_course_app_4/utils/format_utils.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final ProductInCart productInCart;
  const CartItem({Key? key, required this.productInCart}) : super(key: key);

  String get subtitleText {
    var q = productInCart.quantity;
    var p = FormatUtils.currency(productInCart.product.price);
    var t = FormatUtils.currency(productInCart.totalAmount);
    return '$q x $p = $t';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Text(productInCart.product.title.characters.first),
          ),
          title: Text(productInCart.product.title),
          subtitle: Text(subtitleText),
        ),
      ),
    );
  }
}
