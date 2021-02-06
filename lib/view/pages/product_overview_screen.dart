import 'package:flutter/material.dart';
import 'package:gereaciando_estado/presenter/providers/cart_provider.dart';
import 'package:gereaciando_estado/presenter/providers/product_provider.dart';
import 'package:gereaciando_estado/view/widgets/banner_carrusel.dart';
import 'package:gereaciando_estado/view/widgets/cart_badge.dart';
import 'package:gereaciando_estado/view/widgets/navigation_bar.dart';
import 'package:gereaciando_estado/view/widgets/product_grid.dart';
import 'package:provider/provider.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final products = productsProvider.items;
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
            child: Container(
              width: 45,
              child: Icon(Icons.shopping_cart),
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
      body: LayoutBuilder(
        builder: (_, constraints) => ListView(
          children: [
            Container(
              height: constraints.maxHeight * 0.40,
              child: BannerCarrusel(),
            ),
            Container(
              height: constraints.maxHeight * 0.60,
              child: ProductGrid(
                products: products,
              ),
            ),
            Container(
              height: constraints.maxHeight * 0.20,
              child: Image.network(
                "https://cdn4.vectorstock.com/i/1000x1000/96/43/big-sales-special-offer-banner-template-design-vector-23449643.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: constraints.maxHeight * 0.60,
              child: ProductGrid(
                products: products,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
