import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class DataBase{

  Database? database;

  void createDatabase()async
  {
     database = await openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database,version)async{
          if (kDebugMode) {
            print('database created');
          }
          // ID integer
          // title String
          // category String
          // Date String
          // Time String
          // Notes String
          await database.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, category TEXT, Date TEXT, Time TEXT, notes TEXT)'
          ).then((value){
            if (kDebugMode) {
              print('table created');
            }
          }).catchError((error){if (kDebugMode) {
            print("Error When Create the Database");
          }
          });
        },
        onOpen: (database){
          if (kDebugMode) {
            print('database opened');
          }
        }
    );
  }

  Future insertToDatabase(
      String title,
      String category,
      String date,
      String time,
      String notes
      ) async {
   return await database?.transaction((txn) async
   {
       txn.rawInsert(
           'INSERT INTO tasks(title, category, Date, Time, Notes) VALUES($title,$category,$date,$time,$notes)'
       ).then((value){
         if (kDebugMode) {
           print("$value inserted successfully");
         }
       }).catchError((error){
         if (kDebugMode) {
           print('Error When Inserting New Record ${error.toString()}');
         }
       });
   });
  }

}