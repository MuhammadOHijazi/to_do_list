import 'package:flutter/material.dart';

import '../../utils/database.dart';
import 'constant.dart';

class TaskItem extends StatefulWidget {
  final String taskName;
  final String taskTime;
  final String taskDate;
  final bool completed;
  final String category;

  const TaskItem({
    super.key,
    required this.taskName,
    required this.taskTime,
    required this.taskDate,
    required this.completed,
    required this.category,
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  late bool isCompleted;
    // Method to get the icon based on the category
  IconData getCategoryIcon(String category) {
    switch (category) {
      case "article":
        return Icons.article_outlined;
      case "task":
        return Icons.event;
      case "goal":
        return Icons.emoji_events_outlined;
      default:
        return Icons.article_outlined; // Default icon
    }
  }

  // Method to get the color based on the category
  Color getCategoryColor(String category) {
    switch (category) {
      case "article":
        return const Color(0xffDBECF6);
      case "task":
        return const Color(0xffE7E2F3);
      case "goal":
        return const Color(0xffFEF5D3);
      default:
        return Colors.white; // Default color
    }
  }

  // Method to get the icon color based on the category
  Color getCategoryIconColor(String category) {
    switch (category) {
      case "article":
        return articleColor;
      case "task":
        return primaryColor;
      case "goal":
        return eventColor;
      default:
        return Colors.black; // Default icon color
    }
  }

  @override
  void initState() {
    super.initState();
    isCompleted = widget.completed; // Initialize with the current completion status
  }

  // Function to update task completion status in the database
  Future<void> _updateCompletionStatus(bool newStatus) async {
    await ToDoDataBase.instance.updateTaskCompletionByName(widget.taskName, newStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 350,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: isCompleted ? Colors.grey[200] : Colors.white70,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: getCategoryColor(widget.category),
              ),
              child: Icon(
                getCategoryIcon(widget.category),
                color: isCompleted ? Colors.grey : getCategoryIconColor(widget.category),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.taskName,
                  style: TextStyle(
                    fontSize: 18,
                    color: isCompleted ? Colors.grey : Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration:
                    isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                  ),
                ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  widget.taskDate,
                  style: TextStyle(
                    fontSize: 16,
                    color: isCompleted ? Colors.grey : Colors.black54,
                  ),
                ),
                const SizedBox(width: 10,),
                Text(
                  widget.taskTime,
                  style: TextStyle(
                    fontSize: 16,
                    color: isCompleted ? Colors.grey : Colors.black54,
                  ),
                ),
              ],
            ),
        ],
      ),
    ),
          Checkbox(
            value: isCompleted,
            onChanged: (bool? value) {
              setState(() {
                isCompleted = value ?? false;
                _updateCompletionStatus(isCompleted); // Update the status in the database
              });
            },
          ),
    ],
    ),
    );
  }
  }
