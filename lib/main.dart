import 'package:flutter/material.dart';
import 'package:gereaciando_estado/pages/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Minha loja",
      theme: ThemeData(primarySwatch: Colors.orange),
      home: MyHomePage(),
    );
  }
}
