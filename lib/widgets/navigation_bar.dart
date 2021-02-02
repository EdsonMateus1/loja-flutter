import 'package:flutter/material.dart';
import 'package:gereaciando_estado/utils/app_routes.dart';

class NavigationBar extends StatelessWidget {
  static int currRoute = 0;

  void navigatorContrroler(int value, BuildContext context) {
    currRoute = value;
    if (currRoute == 0) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
    } else if (currRoute == 1) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.CART);
    } else if (currRoute == 2) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.ORDER);
    } else if (currRoute == 3) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.CONFIGURATION);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currRoute,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "carrinho",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_headline),
          label: "meus pedidos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.app_settings_alt),
          label: "Gerenciar",
        ),
      ],
      onTap: (value) {
        navigatorContrroler(value, context);
      },
    );
  }
}
