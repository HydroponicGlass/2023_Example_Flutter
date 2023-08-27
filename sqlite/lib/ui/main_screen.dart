import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite/data/test_table.dart';
import 'package:sqlite/helper/database_helper.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    initDB();
  }

  Future<void> initDB() async {
    await databaseHelper.insert(TestTable(name: 'name2', value: 2));
    await databaseHelper.insert(TestTable(name: 'name2', value: 2));
    await databaseHelper.delete(2);
    // await databaseHelper.deleteAll();
    List<TestTable> list = await databaseHelper.select();
    for(var item in list){
      print(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
