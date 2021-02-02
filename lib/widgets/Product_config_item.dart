import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/product.dart';

class ProductConfigItem extends StatelessWidget {
  const ProductConfigItem({
    Key key,
    @required this.products,
  }) : super(key: key);

  final ProductModal products;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        leading: Container(
          width: 70,
          height: 70,
          child: Image.network(
            "${products.imageUrl}",
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "${products.title}",
          style: Theme.of(context).textTheme.headline2,
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                color: Theme.of(context).accentColor,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
