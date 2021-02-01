import 'package:flutter/material.dart';
import 'package:gereaciando_estado/providers/order_provider.dart';
import 'package:gereaciando_estado/widgets/navigation_bar.dart';
import 'package:gereaciando_estado/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Pedidos"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: ListView.builder(
          itemCount: orderProvider.lengthOrder,
          itemBuilder: (context, i) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OrderItem(
                  order: orderProvider.orders[i],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    height: 20,
                    thickness: 1,
                    endIndent: 2,
                    color: Colors.black,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
