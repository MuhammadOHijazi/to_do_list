import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/utils/cubit/cubit.dart';
import 'package:to_do_list/utils/cubit/states.dart';
import 'constant.dart';

class TaskItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ToDoCubit()..initializeCompletion(completed),
      child: BlocConsumer<ToDoCubit, ToDoStates>(
        listener: (context, state) {
          ToDoCubit.get(context).loadTasksFromDatabase();
        },
        builder: (context, state) {
          var cubit = ToDoCubit.get(context);
          bool isCompleted = cubit.completed ?? completed;
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
                      color: getCategoryColor(category),
                    ),
                    child: Icon(
                      getCategoryIcon(category),
                      color: isCompleted
                          ? Colors.grey
                          : getCategoryIconColor(category),
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
                        taskName,
                        style: TextStyle(
                          fontSize: 18,
                          color: isCompleted ? Colors.grey : Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            taskDate,
                            style: TextStyle(
                              fontSize: 16,
                              color: isCompleted ? Colors.grey : Colors.black54,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            taskTime,
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
                    if (value != null) {
                      cubit.toggleCompletion(taskName, value);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
