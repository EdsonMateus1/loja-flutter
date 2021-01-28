import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/product.dart';
import 'package:gereaciando_estado/providers/cart_provider.dart';
import 'package:gereaciando_estado/providers/product_provider.dart';
import 'package:gereaciando_estado/utils/app_routes.dart';
import 'package:gereaciando_estado/widgets/alert_add_cart.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final ProductModal product;

  const ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(
              AppRoutes.PRODUCT_DETAIL,
              arguments:
                  product, // passa argumentos para a rota neste caso e passado o product , ou seja a rota tem acesso aos dados do product
            );
          },
          child: Image.network(
            product.imageUrl,
            //BoxFit.contain O maior possível, mas ainda contendo a fonte inteiramente dentro da caixa de destino.
            //BoxFit.fill Preencha a caixa de destino distorcendo a proporção da fonte.
            //BoxFit.cover O menor possível, mas ainda cobrindo toda a caixa de destino..
            fit: BoxFit.contain,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () => productsProvider.tooggleFavorite(product.id)),
          title: Text(
            product.title,
            textAlign: TextAlign.start,
          ),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cartProvider.addCardItem(product);
              showDialog(
                context: context,
                builder: (context) => AlertAddCart(),
              );
            },
          ),
          subtitle: Text(
            "${product.price}",
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Lato",
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
