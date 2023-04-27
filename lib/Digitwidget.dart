import 'package:flutter/material.dart';

class DigitWidget extends StatelessWidget {
  String number;
  Function onbtnclick;
  DigitWidget(this.number, this.onbtnclick);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff313131)),
              shape: MaterialStateProperty.all( RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
              ))
          ),
          onPressed: () {
            onbtnclick(number);
          },
          child: Text(
            number,
            style: const TextStyle(fontSize: 30,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
