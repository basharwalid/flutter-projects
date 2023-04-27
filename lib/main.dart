import 'package:calculator/CalculatorScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapplication());
}

class Myapplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        calculatorScreen.routeName: (_) => calculatorScreen(),
      },
      initialRoute: calculatorScreen.routeName,
    );
  }
}

