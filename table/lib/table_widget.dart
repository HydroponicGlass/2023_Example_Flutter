import 'package:flutter/material.dart';
import 'data.dart';

class TableWidget extends StatelessWidget {
  final List<Data> data = [
    Data(id: 1, name: "aa", description: "aaa"),
    Data(id: 2, name: "bb", description: "bbb"),
    Data(id: 3, name: "cc", description: "ccc"),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      color: Colors.black12,
      child: Table(
        // border: TableBorder.all(color: Colors.green, width: 5),
        border: TableBorder.symmetric(
          inside: BorderSide(color: Colors.white, width: 1),
        ),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(4),
        },
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TableCell(
                  child: Text(
                'id',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TableCell(
                  child: Text(
                'name',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TableCell(
                  child: Text(
                'description',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ]),
          for (var item in data)
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TableCell(child: Text(item.id.toString())),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TableCell(child: Text(item.name)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TableCell(child: Text(item.description)),
              ),
            ]),
        ],
      ),
    );
  }
}
