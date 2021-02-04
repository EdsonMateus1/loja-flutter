import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/cart_item_modal.dart';
import 'package:gereaciando_estado/models/product.dart';

//mixins
class CartProvider with ChangeNotifier {
  Map<String, CartItemModal> _cardItems = {};
  Map<String, CartItemModal> get cardItems => _cardItems;

  double get totalAmount {
    double total = 0.0;
    _cardItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quatity;
    });
    return total;
  }

  int get lengthCart => _cardItems.length;

  void removeCartItem(CartItemModal cartItem) {
    _cardItems.removeWhere((key, value) => value.id == cartItem.id);
    notifyListeners();
  }

  void addQuatityCartItem(CartItemModal cartItem, int newQuatity) {
    _cardItems.forEach((key, value) {
      if (value.id == cartItem.id) {
        value.quatity = newQuatity;
      }
    });
    notifyListeners();
  }

  void addCardItem(ProductModal product) {
    _cardItems.putIfAbsent(product.id, () {
      return CartItemModal(
        id: Random().nextDouble().toString(),
        title: product.title,
        price: product.price,
        imageUrl: product.imageUrl,
        description: product.description,
        quatity: 1,
      );
    });
    notifyListeners();
  }

  void clear() {
    _cardItems = {};
    notifyListeners();
  }
}
