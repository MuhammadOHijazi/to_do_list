import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class ToDoDataBase {
  static final ToDoDataBase instance = ToDoDataBase._internal();
  Database? _database;

  ToDoDataBase._internal();

  factory ToDoDataBase() {
    return instance;
  }

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database?> _initDatabase() async {
    return await openDatabase(
      'todo.db',
      version: 4,
      onCreate: (database, version) async {
        if (kDebugMode) {
          print('Database created');
        }
        await database.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, taskName TEXT, category TEXT, taskDate TEXT, taskTime TEXT, notes TEXT, completed INTEGER)'
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < newVersion) {
          await db.execute('DROP TABLE IF EXISTS tasks');
          await db.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, taskName TEXT, category TEXT, taskDate TEXT, taskTime TEXT, notes TEXT, completed INTEGER)'
          );

          if (kDebugMode) {
            print('Database upgraded and recreated');
          }
        }
      },
      onOpen: (database) async {
        var value = await getDataFromDatabase(); // Await the future properly
        if (kDebugMode) {
          print('Database opened\n $value\n');
        }
      },
    );
  }

  Future<void> insertToDatabase(String title, String category, String date, String time, String notes, String status) async {
    final db = await database;
    return await db?.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO tasks(taskName, category, taskDate, taskTime, notes, completed) VALUES(?, ?, ?, ?, ?, ?)',
          [
            title,
            category,
            date,
            time,
            notes,
            status
          ]);
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

  // Make sure this method returns List<Map<String, dynamic>> to match expectations
  Future<List<Map<String, dynamic>>> getDataFromDatabase() async {
    final db = await database; // Access the database instance
    try {
      if (db == null) {
        throw Exception("Database is not initialized.");
      }

      // Query the tasks from the 'tasks' table
      List<Map<String, dynamic>> tasks = await db.rawQuery('SELECT * FROM tasks');

      if (tasks.isNotEmpty) {
        if (kDebugMode) {
          print("Tasks loaded from the database: ${tasks.length}");
        }
        return tasks;
      } else {
        if (kDebugMode) {
          print("No tasks found in the database.");
        }
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading tasks from the database: $e');
      }
      return [];
    }
  }

  Future<void> updateTaskCompletionByName(String taskName, bool completed) async {
    final db = await instance.database;
    await db?.update(
      'tasks',
      {'completed': completed ? 1 : 0}, // Store completed as 1 or 0 (boolean)
      where: 'taskName = ?',  // Use correct column name (taskName)
      whereArgs: [taskName],
    );
  }
}
