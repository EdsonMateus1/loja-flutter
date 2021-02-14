import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:gereaciando_estado/data/datasource/data_add_product.dart';
import 'package:gereaciando_estado/domain/usecases/add_product.dart';

class RemoteAddProduct implements AddProduct {
  final DataAddProduct productController;
  RemoteAddProduct(this.productController);
  @override
  void saveForm(
      {BuildContext context,
      GlobalKey<FormState> formKey,
      Map<String, dynamic> formData}) {
    productController.saveForm(
      context: context,
      formData: formData,
      formKey: formKey,
    );
  }
}
