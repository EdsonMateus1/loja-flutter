import 'package:gereaciando_estado/domain/entities/product.dart';

abstract class UpdadeProduct {
  void call(Product product);
}
