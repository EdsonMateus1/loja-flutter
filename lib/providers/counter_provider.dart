import 'package:flutter/cupertino.dart';

class CounterState {
  final state = ValueNotifier<int>(0);
  void increment() => state.value++;
  get value => state.value;
}

class CounterProvider extends InheritedWidget {
  final CounterState counterState = CounterState();

  CounterProvider({Widget child}) : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
