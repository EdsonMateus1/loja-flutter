import 'package:flutter/material.dart';

abstract class CounterState {
  void set aplicarDesconto(double desconto);
  double get desconto;
}

class CounterStateImpl implements CounterState {
  final _desconto = ValueNotifier<double>(0);

  @override
  void set aplicarDesconto(double desconto) {
    _desconto.value = desconto;
  }

  @override
  double get desconto => 200 / 100 * _desconto.value;
}
