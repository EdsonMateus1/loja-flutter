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

  factory ProductModal.fromJson(Map<String, dynamic> map) {
    return ProductModal(
      id: map["id"],
      title: map["title"].toString(),
      description: map["description"].toString(),
      price: double.parse(map["price"]),
      imageUrl: map["imageUrl"].toString(),
    );
  }
}
