import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text(
            "ola",
            textScaleFactor: 10,
          ),
        ),
      ),
    );
  }
}
