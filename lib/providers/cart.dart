import 'package:flutter/foundation.dart';

import '../providers/product.dart';

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  int get quantity => _items.length;

  void addProduct(Product product) {
    var containsProduct = _items.containsKey(product.id);
    if (containsProduct) {
      _items.update(
        product.id,
        (oldItem) => CartItem(
          id: oldItem.id,
          product: oldItem.product,
          quantity: oldItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: product.id + '-cart-item',
          product: product,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}

class CartItem {
  final String id;
  final Product product;
  final int quantity;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
  });
}
