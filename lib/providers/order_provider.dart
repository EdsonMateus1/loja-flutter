import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/order.dart';
import 'package:gereaciando_estado/providers/cart_provider.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModal> _orders = [];

  List<OrderModal> get orders => _orders;

  int get lengthOrder => _orders.length;

  void addOrder(CartProvider cartItem) {
    _orders.insert(
      0,
      OrderModal(
        id: Random().nextDouble().toString(),
        total: cartItem.totalAmount,
        pruduts: cartItem.cardItems.values.toList(),
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
