import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      title: Text(
        'title',
        style: TextStyle(),
      ),
      content: Icon(Icons.add),
      backgroundColor: Colors.white,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              foregroundColor: Colors.blue),
          onPressed: () {
            SystemNavigator.pop();
          },
          child: Text('yes'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              foregroundColor: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('no'),
        ),
      ],
    );
  }
}