import 'package:flutter/widgets.dart';

abstract class DataAddProduct {
  void saveForm({
    BuildContext context,
    GlobalKey<FormState> formKey,
    Map<String, dynamic> formData,
  });
}
