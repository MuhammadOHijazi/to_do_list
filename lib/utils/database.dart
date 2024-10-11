import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class ToDoDataBase {
  static final ToDoDataBase _instance = ToDoDataBase._internal();
  Database? _database;

  ToDoDataBase._internal();

  factory ToDoDataBase() {
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
      version: 2,
      onCreate: (database, version) async {
        if (kDebugMode) {
          print('Database created');
        }
        await database.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, category TEXT, Date TEXT, Time TEXT, notes TEXT, status TEXT)');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < newVersion) {
          await db.execute('DROP TABLE IF EXISTS tasks');
          await db.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, category TEXT, Date TEXT, Time TEXT, notes TEXT, status TEXT)');
          if (kDebugMode) {
            print('Database upgraded and recreated');
          }
        }
      },
      onOpen: (database) {
        var value = getDataFromDatabase();
        if (kDebugMode) {
          print('Database opened\n $value\n');
        }
      },
    );
  }

  Future insertToDatabase(String title, String category, String date,
      String time, String notes, String status) async {
    final db = await database;
    return await db?.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO tasks(title, category, Date, Time, Notes, status) VALUES(?, ?, ?, ?, ?, ?)',
          [title, category, date, time, notes, status]); // Six values for six columns
    }).then((value) {
      if (kDebugMode) {
        print("\n$value inserted successfully\n");
      }
    }).catchError((error) {
      if (kDebugMode) {
        print("\nThere was an error while inserting: $error\n");
      }
    });
  }


  Future<void> getDataFromDatabase() async {
    final db = await database;  // Access the database instance
    if (db != null) {
      List<Map>? tasks = await db.rawQuery('SELECT * FROM tasks');
      if (tasks.isNotEmpty) {
        for (var task in tasks) {
          if (kDebugMode) {
            print("Task: $task");
          }
        }
      } else {
        if (kDebugMode) {
          print("No tasks found in the database.");
        }
      }
    } else {
      if (kDebugMode) {
        print("Database is not initialized.");
      }
    }
  }



}
