import 'package:flutter/material.dart';

class AlertAddCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Adicionado ao carrinho!",
        style: TextStyle(
          fontSize: 18,
          fontFamily: "Lato",
        ),
      ),
    );
  }
}
