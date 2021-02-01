import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/cart_item_modal.dart';
import 'package:gereaciando_estado/models/product.dart';
import 'package:intl/intl.dart';
import 'package:gereaciando_estado/models/order.dart';

class OrderItem extends StatefulWidget {
  final OrderModal order;

  const OrderItem({this.order});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expanded = false;
  List<CartItemModal> _products = [];

  @override
  void initState() {
    _products = widget.order.pruduts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "\$ ${widget.order.total.toStringAsFixed(2)}",
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 19,
              color: Colors.black,
              letterSpacing: 1.1,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(
              DateFormat("dd/MM/yyyy/ hh:mm").format(widget.order.date),
              style: TextStyle(
                fontFamily: "Lato",
                letterSpacing: 1.1,
              ),
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.expand_more,
            ),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
          ),
        ),
        if (_expanded)
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            height: _products.length * 80.0,
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Container(
                    height: 70,
                    width: 70,
                    child: Image.network(
                      "${_products[i].imageUrl}",
                    ),
                  ),
                  title: Text("${_products[i].title}"),
                  subtitle: Text(
                    "quantidade:${_products[i].quatity}",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 19,
                      color: Colors.black,
                      letterSpacing: 1.1,
                    ),
                  ),
                  trailing: Text(
                    "\$ ${_products[i].price} cada",
                    style: TextStyle(
                      fontFamily: "Lato",
                      letterSpacing: 1.1,
                    ),
                  ),
                );
              },
            ),
          )
      ],
    );
  }
}
