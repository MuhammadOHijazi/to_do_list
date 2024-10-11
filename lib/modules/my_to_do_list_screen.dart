import 'package:flutter/material.dart';
import 'package:to_do_list/Shared/Components/constant.dart';
import 'package:to_do_list/Shared/Components/upper_design.dart';
import '../Shared/Components/task_item.dart';
import 'add_new_task_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; // Needed for building the database path

class MyToDoList extends StatefulWidget {
  const MyToDoList({super.key});

  @override
  State<MyToDoList> createState() => MyToDoListState();
}

class MyToDoListState extends State<MyToDoList> {
  late Database db;
  List<Map<String, dynamic>> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasksFromDatabase();
  }

  // Method to open the database and fetch tasks
  Future<void> _loadTasksFromDatabase() async {
    // Open the database (ensure you've created it somewhere else)
    db = await openDatabase(
      join(await getDatabasesPath(), 'todo.db'), // Adjust as per your database
    );

    // Fetch all tasks from the 'tasks' table
    final List<Map<String, dynamic>> taskData = await db.query('tasks');

    // Update the state with the fetched tasks
    setState(() {
      tasks = taskData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            upperDesign(),


            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    // ToDo: Fix the TaskItem completed issue
                    return TaskItem(
                      taskName: task['taskName'],
                      taskTime: task['taskTime'],
                      taskDate: task['taskDate'],
                      completed: false,
                      category: task['category'],
                    );
                    // if (task['completed'] == "1") {
                    //
                    // } else {
                    //   return const SizedBox.shrink();
                    // }
                  },
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                  itemCount: tasks.length,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.all(20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Completed",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    // Filter and show only completed tasks
                    final task = tasks[index];
                    // ToDo: Fix the TaskItem completed issue
                    return TaskItem(
                      taskName: task['taskName'],
                      taskTime: task['taskTime'],
                      taskDate: task['taskDate'],
                      completed: true,
                      category: task['category'],
                    );
                    // if (task['completed'] == "1") {
                    //
                    // } else {
                    //   return const SizedBox.shrink();
                    // }
                  },
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                  itemCount: tasks.length,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddNewTaskScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Add new Task",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
