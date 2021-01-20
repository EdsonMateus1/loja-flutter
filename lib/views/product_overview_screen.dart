import 'package:flutter/material.dart';
import 'package:gereaciando_estado/widgets/product_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha loja"),
      ),
      body: ProductGrid(),
    );
  }
}
