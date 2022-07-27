import 'package:flutter/material.dart';
import 'screens/principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Principal(),
      debugShowCheckedModeBanner: false,
      );
  }
}

