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
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: Container(
            width: 100,
            child: Image.network(
              cartItem.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(cartItem.title),
          ),
          subtitle: Text('Total: R\$ ${cartItem.price * cartItem.quatity}'),
          trailing: Text('${cartItem.quatity}x'),
          onTap: () {
            final product = productsProvider.items
                .singleWhere((element) => element.title == cartItem.title);
            cartProvider.addCardItem(product);
          },
        ),
      ),
    );
  }
}
