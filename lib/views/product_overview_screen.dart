import 'package:flutter/material.dart';
import 'package:gereaciando_estado/providers/cart_provider.dart';
import 'package:gereaciando_estado/providers/product_provider.dart';
import 'package:gereaciando_estado/utils/app_routes.dart';
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
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
            ),
            builder: (ctx, cart, child) => Badge(
              value: cart.lengthCart.toString(),
              //child faz com que o flutter nao der render ou seja apenas o elemento badge
              //que e retornado pela funcao builder vai ser renderizado conforme a mudancao de estado
              // IconButton que esta no child do provider nao sera re renderizado
              child: child,
            ),
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
