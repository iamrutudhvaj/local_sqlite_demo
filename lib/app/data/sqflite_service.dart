import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static late Database db;
  static late String path;

  static Future<void> init() async {
    try {
      var databasesPath = await getDatabasesPath();
      path = "$databasesPath/demo.db";
      print(path);
      await DatabaseService.openDB();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> openDB() async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });
  }

  static Future<void> closeDB() async {
    await db.close();
  }

  static Future<void> insertRawInDB() async {
    await db.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
      print('inserted1: $id1');
      int id2 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
          ['another name', 12345678, 3.1416]);
      print('inserted2: $id2');
    });
    int id3 = await db.insert(
        'Test', {"name": 'another name', "value": 12345678, "num": 3.1416});
    print('inserted3: $id3');
  }

  static Future<void> updateRawOfDB() async {
    int count = await db.rawUpdate(
        'UPDATE Test SET name = ?, value = ? WHERE name = ?',
        ['updated name', '9876', 'some name']);
    print('updated: $count');
  }

  static Future<void> fetchRawsFromDB() async {
    List<Map> list = await db.rawQuery('SELECT * FROM Test');
    print(list);
  }
}
