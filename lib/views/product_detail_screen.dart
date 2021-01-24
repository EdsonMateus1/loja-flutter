import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments
        as Product; // extraindo os arguments que foi passado para essa rota
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 300,
            height: 300,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            color: Colors.grey[350],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FittedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      child: Text(
                        product.description,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    " \$ ${product.price.toString()} a vista",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lato",
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
