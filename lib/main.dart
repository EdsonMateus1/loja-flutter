import 'package:flutter/material.dart';
import 'package:gereaciando_estado/providers/counter_provider.dart';
import 'package:gereaciando_estado/utils/app_routes.dart';
import 'package:gereaciando_estado/views/product_detail_screen.dart';
import 'package:gereaciando_estado/views/product_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Minha loja",
      theme: ThemeData(
        fontFamily: "Lato",
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                fontFamily: "Lato",
              ),
            ),
      ),
      home: ProductOverviewScreen(),
      routes: {
        AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
      },
    );
  }
}
