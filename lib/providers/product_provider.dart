import 'package:flutter/material.dart';
import 'package:gereaciando_estado/data/data_product.dart';
import 'package:gereaciando_estado/models/product.dart';
import '../data/data_product.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModal> _products = Moke_Products;
  bool _filter = false;

  List<ProductModal> get items {
    if (_filter) {
      return _products
          .where((ProductModal product) => product.isFavorite)
          .toList();
    }
    return _products;
  }

  int get lengthProducts => _products.length;

  set activeFilter(bool value) {
    _filter = value;
    notifyListeners();
  }

  void addProduct(ProductModal product) {
    _products.add(product);
    notifyListeners();
  }

  void tooggleFavorite(String id) {
    _products.forEach((ProductModal element) {
      if (element.id == id) {
        element.isFavorite = !element.isFavorite;
        notifyListeners();
        return;
      }
    });
  }
}
