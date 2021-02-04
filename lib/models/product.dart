import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';

class ProductModal {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  ProductModal({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  factory ProductModal.fromJson(Map<String, dynamic> map) {
    return ProductModal(
      id: Random().nextDouble().toString(),
      title: map["title"],
      description: map["description"],
      price: double.parse(map["price"]),
      imageUrl: map["imageUrl"],
    );
  }
}
