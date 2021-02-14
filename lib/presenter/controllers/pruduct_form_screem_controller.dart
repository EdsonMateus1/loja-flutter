import 'package:flutter/material.dart';
import 'package:gereaciando_estado/data/datasource/data_add_product.dart';
import 'package:gereaciando_estado/domain/entities/product.dart';
import 'package:gereaciando_estado/presenter/providers/product_provider.dart';
import 'package:provider/provider.dart';

class PruductFormScreemController implements DataAddProduct {
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
