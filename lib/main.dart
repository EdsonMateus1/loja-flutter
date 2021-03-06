import 'package:gereaciando_estado/presenter/controller/pruduct_form_screem_controller.dart';
import 'package:gereaciando_estado/presenter/providers/cart_provider.dart';
import 'package:gereaciando_estado/presenter/providers/order_provider.dart';
import 'package:gereaciando_estado/presenter/providers/product_provider.dart';
import 'package:gereaciando_estado/view/pages/cart_screen.dart';
import 'package:gereaciando_estado/view/pages/configuration_screen.dart';
import 'package:gereaciando_estado/view/pages/order_screen.dart';
import 'package:gereaciando_estado/view/pages/product_detail_screen.dart';
import 'package:gereaciando_estado/view/pages/product_form_screen.dart';
import 'package:gereaciando_estado/view/pages/product_overview_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:gereaciando_estado/utils/app_routes.dart';

import 'data/usercases/addproduct/remote_add_product.dart';

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
        ChangeNotifierProvider(create: (_) => OrderProvider()),
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
                  letterSpacing: 0.8,
                ),
                headline2: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 19,
                  color: Colors.black,
                  letterSpacing: 1.1,
                ),
                headline3: TextStyle(
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
                headline4: TextStyle(
                  fontFamily: "Lato",
                  color: Theme.of(context).accentColor,
                  fontSize: 20,
                  letterSpacing: 0.8,
                ),
                headline5: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.8,
                ),
                headline6: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0.8,
                ),
              ),
        ),
        routes: {
          AppRoutes.HOME: (ctx) => ProductOverviewScreen(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          AppRoutes.CART: (ctx) => CartScreen(),
          AppRoutes.ORDER: (ctx) => OrderScreen(),
          AppRoutes.CONFIGURATION: (ctx) => ConfigurationScreen(),
          AppRoutes.REGISTER_PRODUCT: (ctx) => ProductFormScreen(
                RemoteAddProduct(
                  productDataSource: PruductFormScreemController(),
                ),
              ),
        },
      ),
    );
  }
}
