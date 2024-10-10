import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class DataBase {
  static final DataBase _instance = DataBase._internal();
  Database? _database;

  DataBase._internal();

  factory DataBase() {
    return _instance;
  }

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database?> _initDatabase() async {
    return await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        if (kDebugMode) {
          print('Database created');
        }
        await database.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, category TEXT, Date TEXT, Time TEXT, notes TEXT)');
      },
      onOpen: (database) {
        if (kDebugMode) {
          print('Database opened');
        }
      },
    );
  }

  Future insertToDatabase(
      String title, String category, String date, String time, String notes) async {
    final db = await database;
    return await db?.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO tasks(title, category, Date, Time, Notes) VALUES(?, ?, ?, ?, ?)',
          [title, category, date, time, notes]);
    }).then((value){
      if (kDebugMode) {
        print("\n$value inserted it successfully \n");
        print(db);
      }
    }).catchError((error){
      if (kDebugMode) {
        print("\nThere was an error while creating is $error\n");
      }
    });
  }
}