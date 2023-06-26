import 'package:flutter/material.dart';

enum EnumData { a, b }

class RadioWidget extends StatefulWidget{
  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  EnumData? _enumData = EnumData.a;

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('a'),
          leading: Radio<EnumData>(
            value: EnumData.a,
            groupValue: _enumData,
            onChanged: (EnumData? value) {
              setState(() {
                _enumData = value;
                print(_enumData);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('b'),
          leading: Radio<EnumData>(
            value: EnumData.b,
            groupValue: _enumData,
            onChanged: (EnumData? value) {
              setState(() {
                _enumData = value;
                print(_enumData);
              });
            },
          ),
        ),
      ],
    );
  }
}