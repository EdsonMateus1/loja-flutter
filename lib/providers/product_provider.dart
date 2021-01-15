import 'package:flutter/material.dart';
import 'package:gereaciando_estado/data/data_product.dart';
import 'package:gereaciando_estado/models/product.dart';
import '../data/data_product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = Moke_Products;

  List<Product> get items => [..._items];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void isFavorite(String id) {
    _items.forEach((Product element) {
      if (element.id == id) {
        element.isFavorite = !element.isFavorite;
        notifyListeners();
        return;
      }
    });
  }
}
