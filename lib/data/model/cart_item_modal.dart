import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
      'quatity': quatity,
    };
  }

  factory CartItemModal.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CartItemModal(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      description: map['description'],
      quatity: map['quatity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModal.fromJson(String source) =>
      CartItemModal.fromMap(json.decode(source));
}
