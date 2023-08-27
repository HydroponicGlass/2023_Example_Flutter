import 'package:flutter/material.dart';

class BasicElevatedButtonWidget extends StatelessWidget {
  void Function() onPressed;
  BasicElevatedButtonWidget(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )
          ),
          child: Text('Button')),
    );
  }
}
