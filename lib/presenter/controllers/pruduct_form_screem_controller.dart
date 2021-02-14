import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/product.dart';
import 'package:gereaciando_estado/presenter/providers/product_provider.dart';
import 'package:provider/provider.dart';

class PruductFormScreemController {
  bool isValidImgUrl(String url) {
    bool isValidUrl = url.toLowerCase().startsWith("http://") ||
        url.toLowerCase().startsWith("https://");
    bool isValidImg =
        url.endsWith(".png") || url.endsWith(".jpg") || url.endsWith(".jpeg");
    return isValidUrl && isValidImg;
  }

  void saveForm({context, formKey, formData}) {
    bool isValid = formKey.currentState.validate();
    if (!isValid) return;

    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);

    // realiza um loop chamando todas as funcoes onSaved que estao nos TextFormField do formulario
    formKey.currentState.save();
    final ProductModal product = ProductModal.fromJson(formData);

    if (formData["id"] == null) {
      productsProvider.addProduct(product);
    } else {
      productsProvider.updateProduct(product);
    }
    Navigator.of(context).pop();
  }
}
