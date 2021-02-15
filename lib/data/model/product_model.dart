import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductModal {
  final String id;
  String title;
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }

  factory ProductModal.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProductModal(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      isFavorite: map['isFavorite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModal.fromJson(String source) =>
      ProductModal.fromMap(json.decode(source));
}
