import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/cart_item_modal.dart';
import 'package:gereaciando_estado/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:gereaciando_estado/providers/product_provider.dart';

class CartItem extends StatelessWidget {
  final CartItemModal cartItem;

  CartItem({@required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final productsProvider = Provider.of<ProductsProvider>(context);
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  child: Image.network(
                    cartItem.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: MediaQuery.of(context).size.width - 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${cartItem.title}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        "\$ ${(cartItem.price * cartItem.quatity).toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GridTileBar(
              backgroundColor: Colors.black87,
              leading: FittedBox(
                child: Text(
                  "${cartItem.description}",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              title: Text(
                "${cartItem.quatity}x",
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.headline5,
              ),
              trailing: IconButton(
                color: Colors.white,
                onPressed: () {
                  cartProvider.removeCartItem(cartItem);
                },
                icon: Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
