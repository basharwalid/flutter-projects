import 'package:calculator/Digitwidget.dart';
import 'package:calculator/operatorwidget.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class calculatorScreen extends StatefulWidget {
  static const String routeName = 'Calculator-Screen';

  @override
  State<calculatorScreen> createState() => _calculatorScreenState();
}

class _calculatorScreenState extends State<calculatorScreen> {
  TextEditingController textarea = TextEditingController();
  String resultTxt = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  resultTxt,
                  style: const TextStyle(fontSize: 48,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  operatorWidget("AC", onAcClick ,),
                  operatorWidget("^", onoperatorclick),
                  operatorWidget("back", onBackClick),
                  operatorWidget("+/-", onMinPlusClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DigitWidget("7", onDigitclick),
                  DigitWidget("8", onDigitclick),
                  DigitWidget("9", onDigitclick),
                  operatorWidget("*", onoperatorclick)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DigitWidget("4", onDigitclick),
                  DigitWidget("5", onDigitclick),
                  DigitWidget("6", onDigitclick),
                  operatorWidget("+", onoperatorclick )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DigitWidget("1", onDigitclick),
                  DigitWidget("2", onDigitclick),
                  DigitWidget("3", onDigitclick),
                  operatorWidget("-", onoperatorclick)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  operatorWidget(".", onDotClick),
                  DigitWidget("0", onDigitclick),
                  operatorWidget("=", onEqualClick),
                  operatorWidget("/", onoperatorclick)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDigitclick(String text) {
    setState(() {
      if (resultTxt == '0') {
        resultTxt = text;
        return;
      }
      resultTxt += text;
    });
  }

  String savedNumber = '';
  String savedOperator = '';
  void onoperatorclick(String ClickedOperator) {
    if (savedOperator.isEmpty) {
      savedNumber = resultTxt;
      savedOperator = ClickedOperator;
      resultTxt = '0';
      setState(() {});
    } else {
      String RHS = resultTxt;
      savedNumber = calculate(RHS, savedNumber, savedOperator);
      savedOperator = ClickedOperator;
      resultTxt = '0';
      setState(() {});
    }
  }

  String calculate(String rhs, String lhs, String operator) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    double res = 0;
    if (operator == '+') {
      res = n1 + n2;
    } else if (operator == '-') {
      res = n1 - n2;
    } else if (operator == '*') {
      res = n1 * n2;
    } else if (operator == '/') {
      res = n1 / n2;
    } else if (operator == '^') {
      res = pow(n1, n2) as double;
    }
    return res.toString();
  }

  void onMinPlusClick(String operator) {
    setState(() {
      if (operator == '+/-') {
        if (resultTxt[0] != '-') {
          resultTxt = '-$resultTxt';
        } else {
          resultTxt = resultTxt.substring(1);
        }
      }
    });
  }
  void onBackClick(String operator) {
    if (operator == 'back') {
      resultTxt = resultTxt.substring(0, resultTxt.length - 1);
      setState(() {});
    }
  }

  void onAcClick(String operator) {
    if (operator == 'AC') {
      savedNumber = '';
      savedOperator = '';
      resultTxt = '';
      setState(() {});
    }
  }
  void onDotClick(String operator){
      setState(() {
        if(operator == '.' && resultTxt!='.') {
          resultTxt += '.';
        }else if (operator=='.' && resultTxt=='.'){
          resultTxt = '.';
        }
      });


  }
  void onEqualClick(String _) {
    String rhs = resultTxt;
    String res = calculate(rhs, savedNumber, savedOperator);
    resultTxt = res;
    savedOperator = '';
    savedNumber = '';
    setState(() {});
  }

}
