import 'package:flutter/widgets.dart';
import 'package:gereaciando_estado/data/datasource/remote_add_product.dart';
import 'package:gereaciando_estado/domain/usecases/add_product.dart';

class RemoteAddProduct implements AddProduct {
  final IRemoteAddProduct productDataSource;
  RemoteAddProduct({@required this.productDataSource});
  @override
  void call({
    BuildContext context,
    GlobalKey<FormState> formKey,
    Map<String, dynamic> formData,
  }) {
    productDataSource.saveForm(
      context: context,
      formData: formData,
      formKey: formKey,
    );
  }
}
