// import 'package:flutter/material.dart';
// import 'package:gereaciando_estado/providers/product_provider.dart';
// import 'package:gereaciando_estado/widgets/product_item.dart';
// import 'package:provider/provider.dart';

// class ProductGrid extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final products = Provider.of<ProductsProvider>(context).items;
//     return GridView.builder(
//       padding: const EdgeInsets.all(10),
//       itemCount: products.length,
//       itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
//         // ChangeNotifierProvider.value e usando quando voce ja tem instacias criadas
//         value: products[i],
//         child: ProductItem(),
//       ),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 3 / 3,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//     );
//   }
// }
