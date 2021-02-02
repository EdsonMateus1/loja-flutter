import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gereaciando_estado/models/product.dart';
import 'package:gereaciando_estado/providers/product_provider.dart';
import 'package:gereaciando_estado/widgets/Product_config_item.dart';
import 'package:provider/provider.dart';
import 'package:gereaciando_estado/widgets/navigation_bar.dart';

class ConfigurationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final products = productsProvider.items;
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciar Produtos"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: ListView.builder(
          itemCount: productsProvider.lengthProducts,
          itemBuilder: (context, i) {
            return Column(
              children: [
                ProductConfigItem(products: products[i]),
                Divider(
                  color: Colors.black,
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
