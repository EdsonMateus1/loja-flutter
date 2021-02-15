import 'package:flutter/material.dart';
import 'package:gereaciando_estado/data/model/cart_item_modal.dart';
import 'package:gereaciando_estado/presenter/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import 'alert_confirme_delete.dart';

class CartItemWidget extends StatefulWidget {
  final CartItemModal cartItem;

  CartItemWidget({@required this.cartItem});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItemWidget> {
  int selected = 1;

  @override
  void initState() {
    super.initState();
    selected = widget.cartItem.quatity;
  }

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
      child: Card(
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
                      widget.cartItem.imageUrl,
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
                          "${widget.cartItem.title}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          "\$ ${(widget.cartItem.price * widget.cartItem.quatity).toStringAsFixed(2)}",
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
                  child: Container(
                    width: 200,
                    child: Text(
                      "${widget.cartItem.description}",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
                title: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: DropdownButton(
                    items: [
                      DropdownMenuItem(
                        child: Text("1x"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("2x"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("3x"),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text("4x"),
                        value: 4,
                      ),
                    ],
                    value: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = value;
                      });
                      cartProvider.addQuatityCartItem(
                          widget.cartItem, selected);
                    },
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                trailing: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertConfirmeDelete<CartItemModal>(
                          remove: cartProvider.removeCartItem,
                          item: widget.cartItem,
                          msg:
                              "Tem certeza que deseja remover esse item do seu carrinho?",
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
