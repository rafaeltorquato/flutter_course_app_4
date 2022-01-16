import 'package:flutter/foundation.dart';

import '../providers/product.dart';

class Cart with ChangeNotifier {
  final Map<String, ProductInCart> _items = {};

  int get totalProducts => _items.length;

  double get totalAmount => _items.entries
      .map((e) => e.value)
      .map((e) => e.totalAmount)
      .fold(0.0, (a, b) => a + b);

  bool containsProduct(Product product) => _items.containsKey(product.id);

  void addProduct(Product product) {
    if (containsProduct(product)) {
      _items.update(
        product.id,
        (oldItem) => ProductInCart(
          id: oldItem.id,
          product: oldItem.product,
          quantity: oldItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => ProductInCart(
          id: product.id + '-cart-item',
          product: product,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  ProductInCart getItemAt(int index) {
    return _items.entries.elementAt(index).value;
  }

  void removeItem(ProductInCart productInCart) {
    _items.remove(productInCart.product.id);
    notifyListeners();
  }
}

class ProductInCart {
  final String id;
  final Product product;
  final int quantity;

  ProductInCart({
    required this.id,
    required this.product,
    required this.quantity,
  });

  double get totalAmount => quantity * product.price;
}
