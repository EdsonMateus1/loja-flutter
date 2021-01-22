import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/cart_item.dart';
import 'package:gereaciando_estado/models/product.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _cardItems = {};

  Map<String, CartItem> get cardItems => _cardItems;

  double get totalAmount {
    double total = 0.0;
    _cardItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quatity;
    });
    return total;
  }

  int get lengthCart => _cardItems.length;

  void addCardItem(Product product) {
    if (_cardItems.containsKey(product.id)) {
      _cardItems.update(product.id, (itemCurrent) {
        return CartItem(
          id: itemCurrent.id,
          title: itemCurrent.title,
          price: itemCurrent.price,
          imageUrl: itemCurrent.imageUrl,
          quatity: itemCurrent.quatity + 1,
        );
      });
    } else {
      _cardItems.putIfAbsent(product.id, () {
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
