import 'package:flutter/material.dart';
import 'package:gereaciando_estado/utils/app_routes.dart';

class NavigationBar extends StatelessWidget {
  static int currRoute = 0;

  void navigatorContrroler(int value, BuildContext context) {
    currRoute = value;
    if (currRoute == 0) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
    }
    if (currRoute == 1) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.CART);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currRoute,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text("carrinho"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_headline),
          title: Text("meus pedidos"),
        ),
      ],
      onTap: (value) {
        navigatorContrroler(value, context);
      },
    );
  }
}
