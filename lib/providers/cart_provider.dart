import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/cart_item.dart';
import 'package:gereaciando_estado/models/product.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get lengthCart => _items.length;

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id, (itemCurrent) {
        return CartItem(
          id: itemCurrent.id,
          title: itemCurrent.title,
          price: itemCurrent.price,
          imageUrl: itemCurrent.imageUrl,
          quatity: itemCurrent.quatity + 1,
        );
      });
    } else {
      _items.putIfAbsent(product.id, () {
        return CartItem(
          id: Random().nextDouble().toString(),
          title: product.title,
          price: product.price,
          imageUrl: product.imageUrl,
          quatity: 1,
        );
      });
    }
    notifyListeners();
  }
}
