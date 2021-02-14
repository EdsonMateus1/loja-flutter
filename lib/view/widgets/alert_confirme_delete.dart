import 'package:flutter/material.dart';
import 'package:gereaciando_estado/domain/entities/cart_item_modal.dart';
import 'package:gereaciando_estado/presenter/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class AlertConfirmeDelete<T> extends StatelessWidget {
  final T item;
  final String msg;
  final void Function(T) remove;

  const AlertConfirmeDelete({this.item, this.remove, this.msg});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Nao"),
        ),
        TextButton(
          onPressed: () {
            remove(item);
            Navigator.of(context).pop();
          },
          child: Text("Sim"),
        ),
      ],
      title: Text(
        "Ops 😓",
        style: TextStyle(
          fontSize: 18,
          fontFamily: "Lato",
        ),
      ),
      content: Text(
        msg,
        style: TextStyle(
          fontSize: 17,
          fontFamily: "Lato",
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
