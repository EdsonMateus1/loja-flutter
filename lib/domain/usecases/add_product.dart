import 'package:flutter/widgets.dart';

abstract class AddProduct {
  void call({
    BuildContext context,
    GlobalKey<FormState> formKey,
    Map<String, dynamic> formData,
  });
}
