import 'package:gereaciando_estado/models/cart_item_modal.dart';

class OrderModal {
  final String id;
  final double total;
  final List<CartItemModal> pruduts;
  final DateTime date;

  OrderModal({this.id, this.total, this.pruduts, this.date});
}
