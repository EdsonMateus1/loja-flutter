import 'package:gereaciando_estado/providers/cart_provider.dart';
import 'package:gereaciando_estado/providers/product_provider.dart';
import 'package:gereaciando_estado/views/cart_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:gereaciando_estado/utils/app_routes.dart';
import 'package:gereaciando_estado/views/product_detail_screen.dart';
import 'package:gereaciando_estado/views/product_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Minha loja",
        theme: ThemeData(
          fontFamily: "Lato",
          primarySwatch: Colors.pink,
          accentColor: Colors.blueAccent,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                  fontFamily: "Lato",
                ),
                headline2: TextStyle(
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontSize: 20,
                ),
                headline3: TextStyle(
                    fontFamily: "Lato",
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                headline4: TextStyle(
                  fontFamily: "Lato",
                  color: Theme.of(context).accentColor,
                  fontSize: 20,
                ),
                headline5: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                headline6: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
        ),
        home: ProductOverviewScreen(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          AppRoutes.CART: (ctx) => CartScreen()
        },
      ),
    );
  }
}
