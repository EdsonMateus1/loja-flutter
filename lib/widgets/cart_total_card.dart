import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/cart_item_modal.dart';
import 'package:gereaciando_estado/providers/cart_provider.dart';
import 'package:gereaciando_estado/providers/order_provider.dart';
import 'package:provider/provider.dart';

class CardTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final orderProvider = Provider.of<OrderProvider>(context);
    return Card(
      elevation: 3,
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              "Total",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(width: 10),
            Text(
              "R\$ ${cartProvider.totalAmount.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.headline3,
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                orderProvider.addOrder(cartProvider);
                cartProvider.clear();
              },
              child: Text(
                "Comprar",
                style: Theme.of(context).textTheme.headline3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
