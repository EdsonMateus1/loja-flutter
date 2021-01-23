// import 'package:flutter/material.dart';
// import 'package:gereaciando_estado/models/product.dart';
// import 'package:gereaciando_estado/utils/app_routes.dart';
// import 'package:provider/provider.dart';

// class ProductItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final product = Provider.of<Product>(
//       context,
//       listen: false,
//     ); // listen: pode ser usando para que o provider nao notifique a aplicacao de uma mudanca
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: GridTile(
//         child: GestureDetector(
//           onTap: () {
//             Navigator.of(context).pushNamed(
//               AppRoutes.PRODUCT_DETAIL,
//               arguments: product,
//             );
//           },
//           child: Image.network(
//             product.imageUrl,
//             fit: BoxFit.fill,
//           ),
//         ),
//         footer: GridTileBar(
//           backgroundColor: Colors.black87,
//           leading: Consumer<Product>(
//             // e usado para consumir o provider, apenas quem esta dentro do consumir vai sofrer uma renderizacao
//             //child: Text("elemto que nunca muda"),
//             builder: (context, product, child) => IconButton(
//               icon: Icon(
//                   product.isFavorite ? Icons.favorite : Icons.favorite_border),
//               color: Theme.of(context).accentColor,
//               onPressed: product.tooggleFavorite,
//             ),
//           ),
//           title: Text(
//             product.title,
//             textAlign: TextAlign.center,
//           ),
//           trailing: IconButton(
//             icon: Icon(Icons.shopping_cart),
//             color: Theme.of(context).accentColor,
//             onPressed: () {},
//           ),
//         ),
//       ),
//     );
//   }
//  final product = productsProvider.items
//                 .singleWhere((element) => element.title == cartItem.title);
//             cartProvider.addCardItem(product);
// }
