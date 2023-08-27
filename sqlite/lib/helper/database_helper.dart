import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../data/test_table.dart';

final String TableName = 'testTable';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    return await initDB();
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'database.db');

    return await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  FutureOr<void> _onCreate(Database db, int version) {
    String sql = '''
    CREATE TABLE $TableName(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    value INTEGER
    )
    ''';

    db.execute(sql);
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {}

  Future<void> insert(TestTable item) async {
    var db = await database;

    await db.insert(
        TableName,
        item.toMap()
    );
  }

  Future<List<TestTable>> select() async {
    var db = await database;

    // 테이블에 있는 모든 field 값을 maps에 저장한다.
    final List<Map<String, dynamic>> maps = await db.query(TableName);

    return List.generate(maps.length, (index) {
      return TestTable(
          id: maps[index]['id'] as int,
          name: maps[index]['name'] as String,
          value: maps[index]['value'] as int,
      );
    });
  }

  Future<void> delete(int id) async {
    var db = await database;

    await db.delete(
        TableName,
        where: 'id = ?',
        whereArgs: [id]
    );
  }
  Future<void> deleteAll() async {
    var db = await database;

    await db.delete(
        TableName,
    );
  }
}
