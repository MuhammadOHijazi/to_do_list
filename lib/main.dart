import 'package:flutter/material.dart';
import 'package:to_do_list/utils/database.dart';
import 'modules/my_to_do_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    DataBase database = DataBase();
    database.createDatabase();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyToDoList(),

    );
  }
}

