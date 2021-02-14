import 'package:flutter/widgets.dart';

abstract class AddProduct {
  void saveForm({
    BuildContext context,
    GlobalKey<FormState> formKey,
    Map<String, dynamic> formData,
  });
}
