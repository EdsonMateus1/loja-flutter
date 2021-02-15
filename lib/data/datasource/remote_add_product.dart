import 'package:flutter/widgets.dart';

abstract class IRemoteAddProduct {
  void saveForm({
    BuildContext context,
    GlobalKey<FormState> formKey,
    Map<String, dynamic> formData,
  });
}
