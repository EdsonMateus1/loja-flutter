import 'package:flutter/material.dart';
import 'package:gereaciando_estado/domain/entities/product.dart';
import 'package:gereaciando_estado/moke_data/data_product.dart';

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

  void updateProduct(ProductModal productModal) {
    // indexWhere retornar o index no array do elemento que passar pela condicao
    // se nao for encontrado retonar -1
    final index = _products.indexWhere((prod) => prod.id == productModal.id);
    if (index >= 0) {
      _products[index] = productModal;
      notifyListeners();
    }

    // _products.forEach((product) {
    //   if (product.id == productModal.id) {
    //     product = productModal;
    //     notifyListeners();
    //   }
    // });
    // notifyListeners();
  }

  void removeProduct(ProductModal product) {
    _products.removeWhere((prod) => prod.id == product.id);
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
