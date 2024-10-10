import 'package:flutter/material.dart';
import 'package:to_do_list/modules/add_new_task_screen.dart';
import 'modules/my_to_do_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyToDoList(),

    );
  }
}

