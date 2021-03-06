import 'package:flutter/material.dart';
import 'package:gereaciando_estado/data/model/cart_item_modal.dart';
import 'package:gereaciando_estado/presenter/providers/cart_provider.dart';
import 'package:gereaciando_estado/view/widgets/cart_item.dart';
import 'package:gereaciando_estado/view/widgets/cart_total_card.dart';
import 'package:gereaciando_estado/view/widgets/navigation_bar.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final List<CartItemModal> cartItem = cartProvider.cardItems.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Carrinho",
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.lengthCart,
              itemBuilder: (ctx, i) => Container(
                child: CartItemWidget(
                  cartItem: cartItem[i],
                ),
              ),
            ),
          ),
          CardTotal(),
        ],
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
