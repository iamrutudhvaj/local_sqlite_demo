import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'model/book_model.dart';

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
          'CREATE TABLE BOOKS (id INTEGER PRIMARY KEY, name TEXT, author TEXT)');
    });
  }

  static Future<void> closeDB() async {
    await db.close();
  }

  static Future<void> insertBook(Book book) async {
    int id = await db.insert('BOOKS', book.toJson());
    print('${book.toJson()} inserted: $id');
  }

  static Future<void> updateRawOfDB() async {
    int count = await db.rawUpdate(
        'UPDATE Test SET name = ?, value = ? WHERE name = ?',
        ['updated name', '9876', 'some name']);
    print('updated: $count');
  }

  static Future<List<Book>> fetchBooks() async {
    List<Map> list = await db.rawQuery('SELECT * FROM BOOKS');
    var dataList =
        list.map((e) => Book.fromJson(e as Map<String, dynamic>)).toList();
    return dataList;
  }
}
