import 'package:flutter/material.dart';
import 'package:gereaciando_estado/data/model/cart_item_modal.dart';
import 'package:gereaciando_estado/data/model/order_model.dart';
import 'package:intl/intl.dart';

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
    return Column(children: [
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
            _expanded ? Icons.expand_less : Icons.expand_more,
          ),
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
        ),
      ),
      if (_expanded)
        Column(
          children: _products.map(
            (products) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        height: 70,
                        width: 70,
                        child: Image.network(
                          "${products.imageUrl}",
                        ),
                      ),
                      title: Text("${products.title}"),
                      subtitle: Text(
                        "quantidade:${products.quatity}",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 19,
                          color: Colors.black,
                          letterSpacing: 1.1,
                        ),
                      ),
                      trailing: Text(
                        "\$ ${products.price} cada",
                        style: TextStyle(
                          fontFamily: "Lato",
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
    ]);
  }
}
