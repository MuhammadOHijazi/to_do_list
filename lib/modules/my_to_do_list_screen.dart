import 'package:flutter/material.dart';
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
    List monthList = [
      "Month",
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header section (date and title)
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xff4A3780),
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "${monthList[DateTime.now().month]} ${DateTime.now().day}, ${DateTime.now().year}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "My Todo List",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Positioned circular decorations
                Positioned(
                  left: -100,
                  bottom: -90,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white10,
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff4A3780),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -50,
                  top: -15,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white10,
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 65,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff4A3780),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Active tasks section
                    TaskItem(
                      taskName: "Study lesson",
                      taskTime: "4:00 PM",
                      completed: false,
                      icon: Icons.article_outlined,
                      iconColor: Color(0xffDBECF6),
                    ),
                    TaskItem(
                      taskName: "Run 5k",
                      taskTime: "5:00 PM",
                      completed: false,
                      icon: Icons.emoji_events_outlined,
                      iconColor: Color(0xffFEF5D3),
                    ),
                    TaskItem(
                      taskName: "Go to party",
                      taskTime: "10:00 PM",
                      completed: false,
                      icon: Icons.event,
                      iconColor: Color(0xffE7E2F3),
                    ),
                    // Add more TaskItem widgets here
                  ],
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
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Completed section
                    TaskItem(
                      taskName: "Game meetup",
                      taskTime: "1:00 PM",
                      completed: true,
                      icon: Icons.event,
                      iconColor: Color(0xffE7E2F3),
                    ),
                    TaskItem(
                      taskName: "Take out trash",
                      taskTime: "1:30 PM",
                      completed: true,
                      icon: Icons.article_outlined,
                      iconColor: Color(0xffDBECF6),
                    ),
                    // Add more completed TaskItem widgets here
                  ],
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
                      borderRadius: BorderRadius.circular(25), // Rounded corners
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
