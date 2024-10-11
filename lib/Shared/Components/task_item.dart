import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  final String taskName;
  final String taskTime;
  final bool completed;
  final IconData icon;
  final Color iconColor;

  const TaskItem({
    super.key,
    required this.taskName,
    required this.taskTime,
    required this.completed,
    required this.icon,
    required this.iconColor,
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  late bool isCompleted;

  @override
  void initState() {
    super.initState();
    isCompleted = widget.completed; // Initialize the completion status
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 350,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: isCompleted ? Colors.grey[200] : Colors.white70, // Completed tasks appear faded
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.all(10),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.iconColor,
              ),
              child: Icon(
                widget.icon,
                color: isCompleted ? Colors.grey : Colors.black, // Icon fades if task is completed
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              widget.taskName,
              style: TextStyle(
                fontSize: 18,
                color: isCompleted ? Colors.grey : Colors.black,
                fontWeight: FontWeight.bold,
                decoration: isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none, // Strikethrough for completed tasks
              ),
            ),
          ),
          Text(
            widget.taskTime,
            style: TextStyle(
              fontSize: 16,
              color: isCompleted ? Colors.grey : Colors.black,
            ),
          ),
          Checkbox(
            value: isCompleted,
            onChanged: (bool? value) {
              setState(() {
                isCompleted = value ?? false;
              });
            },
          ),
        ],
      ),
    );
  }
}
