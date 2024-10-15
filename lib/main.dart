import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/utils/cubit/bloc_observer.dart';
import 'modules/my_to_do_list_screen.dart';

void main(){
  Bloc.observer = MyBlocObserver();
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
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyToDoList(),

    );
  }
}

