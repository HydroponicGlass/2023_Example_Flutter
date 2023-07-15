import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ref : https://velog.io/@sharveka_11/Flutter-4.-ListTile

class ListTileWidget extends StatelessWidget {
  List<String> dummy_list = ['aaa', 'bbb', 'ccc'];

  void _listTileOnTap(String value) {
    print(value);
  }

  void _listTileIconOnTap(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true, // generally if there is no this line, error occurs
        // physics: const NeverScrollableScrollPhysics(), // if listview locate in SingleChildScrollView, use it
        padding: const EdgeInsets.all(8),
        itemCount: dummy_list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 0,
            color: Colors.lightBlueAccent,
            child: ListTile(
              title: Text(
                dummy_list[index],
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(dummy_list[index]),
              trailing: GestureDetector(
                  onTap: () =>
                      _listTileIconOnTap("listtileicon : " + dummy_list[index]),
                  child: Icon(Icons.add)),
              onTap: () => _listTileOnTap("listtile : " + dummy_list[index]),
            ),
          );
        });
  }
}
