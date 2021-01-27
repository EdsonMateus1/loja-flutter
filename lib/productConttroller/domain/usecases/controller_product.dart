import 'package:gereaciando_estado/productConttroller/domain/entities/pruduct.dart';

abstract class ProductConttoler {
  List<ProductEnti> get product;
  set activeFilter(bool value);
  void addProduct(ProductEnti product);
  void tooggleFavorite(String id);
}
