import 'package:flutter/material.dart';
import 'package:gereaciando_estado/data/data_product.dart';
import 'package:gereaciando_estado/models/product.dart';
import '../data/data_product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = Moke_Products;
  bool _filter = false;

  List<Product> get items {
    if (_filter) {
      return _items.where((Product product) => product.isFavorite).toList();
    }
    return _items;
  }

  set activeFilter(bool value) {
    _filter = value;
    notifyListeners();
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void tooggleFavorite(String id) {
    _items.forEach((Product element) {
      if (element.id == id) {
        element.isFavorite = !element.isFavorite;
        notifyListeners();
        return;
      }
    });
  }
}
