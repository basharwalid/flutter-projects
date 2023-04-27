import 'package:flutter/material.dart';

class operatorWidget extends StatelessWidget {
  String operator;
  Function onbtnclick;
  Color color;
  operatorWidget(this.operator, this.onbtnclick , {this.color = const Color(0xfff69906)});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all( RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
            ))
          ),
          onPressed: () {
            onbtnclick(operator);
          },
          child: Text(
            operator,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
