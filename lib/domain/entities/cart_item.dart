import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String description;
  int quatity;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
    @required this.quatity,
    @required this.description,
  });
}
