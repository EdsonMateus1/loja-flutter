import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/cart_item_modal.dart';
import 'package:gereaciando_estado/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class AlertConfirmeDelete extends StatelessWidget {
  final CartItemModal cartItem;

  const AlertConfirmeDelete(this.cartItem);
  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return AlertDialog(
      actions: [
        FlatButton(
          onPressed: () {
            cartProvider.removeCartItem(cartItem);
            Navigator.of(context).pop();
          },
          child: Text("Sim"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Nao"),
        ),
      ],
      title: Text(
        "Ops 😓 você tem certeza disso?",
        style: TextStyle(
          fontSize: 18,
          fontFamily: "Lato",
        ),
      ),
    );
  }
}
