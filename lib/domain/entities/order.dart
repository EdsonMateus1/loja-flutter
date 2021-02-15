import 'package:gereaciando_estado/domain/entities/cart_item.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> pruduts;
  final DateTime date;

  Order({this.id, this.total, this.pruduts, this.date});
}
