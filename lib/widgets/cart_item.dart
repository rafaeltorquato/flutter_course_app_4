// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_course_app_4/utils/app_colors.dart';
import 'package:flutter_course_app_4/utils/format_utils.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final Function onRemove;
  final ProductInCart productInCart;
  const CartItem({
    Key? key,
    required this.productInCart,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onRemove(productInCart),
      key: ValueKey(productInCart.id),
      background: Container(
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          size: 30,
          color: Colors.white,
        ),
        decoration: BoxDecoration(color: AppColors.error),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: FittedBox(
              child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(FormatUtils.currency(productInCart.product.price)),
          )),
        ),
        title: Text(productInCart.product.title),
        subtitle: Text(
          'Total ${FormatUtils.currency(productInCart.totalAmount)}',
        ),
        trailing: Text('x ${productInCart.quantity}'),
      ),
    );
  }
}
