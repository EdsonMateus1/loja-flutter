import 'package:flutter/material.dart';
import 'package:gereaciando_estado/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CardTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(25),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              "Total",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(width: 10),
            Chip(
              backgroundColor: Theme.of(context).accentColor,
              label: Text(
                "R\$ ${cartProvider.totalAmount}",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Spacer(),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Comprar",
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
