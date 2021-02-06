import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/product.dart';
import 'package:gereaciando_estado/presenter/providers/product_provider.dart';
import 'package:provider/provider.dart';

class PruductFormScreemController {
  final formKey = GlobalKey<FormState>();
  final formData = Map<String, dynamic>();
  final priceFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final imagemFocusNode = FocusNode();
  final imagemController = TextEditingController();

  bool isValidImgUrl(String url) {
    bool isValidUrl = url.toLowerCase().startsWith("http://") ||
        url.toLowerCase().startsWith("https://");
    bool isValidImg =
        url.endsWith(".png") || url.endsWith(".jpg") || url.endsWith(".jpeg");
    return isValidUrl && isValidImg;
  }

  void saveForm(context) {
    bool isValid = formKey.currentState.validate();
    if (!isValid) return;
    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    formKey.currentState.save();
    print(formData);
    final ProductModal product = ProductModal.fromJson(formData);
    productsProvider.addProduct(product);
    Navigator.of(context).pop();
  }
}
