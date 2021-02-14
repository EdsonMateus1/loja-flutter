import 'package:flutter/material.dart';
import 'package:gereaciando_estado/domain/entities/product.dart';
import 'package:gereaciando_estado/presenter/providers/product_provider.dart';
import 'package:gereaciando_estado/utils/app_routes.dart';
import 'package:gereaciando_estado/view/widgets/alert_confirme_delete.dart';
import 'package:provider/provider.dart';

class ProductConfigItem extends StatelessWidget {
  const ProductConfigItem({
    Key key,
    @required this.products,
  }) : super(key: key);

  final ProductModal products;

  @override
  Widget build(BuildContext context) {
    final ProductsProvider productsProvider = Provider.of(context);
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
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.REGISTER_PRODUCT,
                    arguments: products,
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertConfirmeDelete<ProductModal>(
                          item: products,
                          remove: productsProvider.removeProduct,
                          msg: "Tem certeza que deseja remover o produto",
                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
