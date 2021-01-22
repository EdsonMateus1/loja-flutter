import 'package:flutter/material.dart';
import 'package:gereaciando_estado/providers/cart_provider.dart';
import 'package:gereaciando_estado/widgets/cart_total_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Carrinho",
        ),
      ),
      body: Column(
        children: [
          CardTotal(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.lengthCart,
              itemBuilder: (ctx, i) => Text("teste"),
            ),
          )
        ],
      ),
    );
  }
}
