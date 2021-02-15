import 'dart:convert';

import 'package:gereaciando_estado/data/model/cart_item_modal.dart';

class OrderModal {
  final String id;
  final double total;
  final List<CartItemModal> pruduts;
  final DateTime date;

  OrderModal({this.id, this.total, this.pruduts, this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'total': total,
      'pruduts': pruduts?.map((x) => x?.toMap())?.toList(),
      'date': date?.millisecondsSinceEpoch,
    };
  }

  factory OrderModal.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OrderModal(
      id: map['id'],
      total: map['total'],
      pruduts: List<CartItemModal>.from(
          map['pruduts']?.map((x) => CartItemModal.fromMap(x))),
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModal.fromJson(String source) =>
      OrderModal.fromMap(json.decode(source));
}
