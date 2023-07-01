import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  void _onPressed() {
    print("OutlinedButtonWidget pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16),
      child: OutlinedButton(
          style: ButtonStyle(
              side: MaterialStateProperty.all(BorderSide(color: Colors.blue)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)))),
          onPressed: () => _onPressed(),
          child: Text(
            "outlined buttons",
          )),
    );
  }
}
