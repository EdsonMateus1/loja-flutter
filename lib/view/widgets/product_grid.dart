import 'package:flutter/material.dart';
import 'package:gereaciando_estado/data/model/product_model.dart';
import 'package:gereaciando_estado/view/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModal> products;

  const ProductGrid({this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductItem(products[i]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1, // largura / altura
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
    );
  }
}
