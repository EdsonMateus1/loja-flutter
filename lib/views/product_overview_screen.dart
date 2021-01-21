import 'package:flutter/material.dart';
import 'package:gereaciando_estado/providers/cart_provider.dart';
import 'package:gereaciando_estado/providers/product_provider.dart';
import 'package:gereaciando_estado/widgets/cart_badge.dart';
import 'package:gereaciando_estado/widgets/product_grid.dart';
import 'package:provider/provider.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha loja"),
        actions: [
          PopupMenuButton(
            onSelected: (bool value) {
              productsProvider.activeFilter = value;
            },
            icon: Icon(Icons.more_vert_sharp),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Somente favoritos"),
                value: true,
              ),
              PopupMenuItem(
                child: Text("Todos"),
                value: false,
              )
            ],
          ),
          Consumer<CartProvider>(
            builder: (ctx, cart, _) => Badge(
              value: cart.lengthCart.toString(),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
