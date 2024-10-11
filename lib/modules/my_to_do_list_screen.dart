import 'package:flutter/material.dart';
import 'package:to_do_list/Shared/Components/upper_design.dart';
import '../Shared/Components/task_item.dart';
import 'add_new_task_screen.dart';

class MyToDoList extends StatefulWidget {
  const MyToDoList({super.key});

  @override
  State<MyToDoList> createState() => MyToDoListState();
}

class MyToDoListState extends State<MyToDoList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            upperDesign(),
            Expanded(
              // Wrap ListView in Expanded
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
                child: ListView.separated(
                  itemBuilder: (context, index) => const TaskItem(
                    taskName: "Study lesson",
                    taskTime: "4:00 PM",
                    taskDate: "2024-10-15", // Pass the date here
                    completed: false,
                    category: "task", // Can be 'article', 'task', or 'goal'
                  ),
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                  itemCount: 10,
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
              // Wrap ListView in Expanded
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
                child: ListView.separated(
                  itemBuilder: (context, index) => const TaskItem(
                    taskName: "Study lesson",
                    taskTime: "4:00 PM",
                    taskDate: "2024-10-15", // Pass the date here
                    completed: true,
                    category: "article", // Can be 'article', 'task', or 'goal'
                  ),
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                  itemCount: 10,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.all(20),
              child: SizedBox(
                width: double.infinity, // Full width button
                height: 50, // Fixed height
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddNewTaskScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4A3780), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(25), // Rounded corners
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
