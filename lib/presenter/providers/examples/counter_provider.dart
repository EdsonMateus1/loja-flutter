import 'package:flutter/material.dart';
import 'counter_state.dart';

// componente InheritedWidget usado como provider para fazer comunicao entre componentes
class CounterProvider extends InheritedWidget {
  final CounterState counterState;

  CounterProvider(this.counterState, {Widget child}) : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
