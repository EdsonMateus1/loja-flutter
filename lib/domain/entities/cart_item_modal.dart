import 'package:flutter/foundation.dart';

class CartItemModal {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String description;
  int quatity;

  CartItemModal({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
    @required this.quatity,
    @required this.description,
  });
}