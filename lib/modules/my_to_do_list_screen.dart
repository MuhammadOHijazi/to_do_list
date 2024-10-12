import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/Shared/Components/constant.dart';
import 'package:to_do_list/Shared/Components/upper_design.dart';
import 'package:to_do_list/utils/cubit/cubit.dart';
import 'package:to_do_list/utils/cubit/states.dart';
import '../Shared/Components/task_item.dart';
import 'add_new_task_screen.dart';

class MyToDoList extends StatelessWidget {
  const MyToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ToDoCubit()..loadTasksFromDatabase(),  // Load tasks when Cubit is created
      child: BlocConsumer<ToDoCubit, ToDoStates>(
        listener: (context, state) {
          print("$state");
          if (state is ToDoCompletedState)
            {
              ToDoCubit.get(context).loadTasksFromDatabase();
              print(state);
            }
        },
        builder: (context, state) {
          var cubit = ToDoCubit.get(context);

          if (state is ToDoInitialState || state is ToDoLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ToDoLoadedState) {
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
                            final task = cubit.tasks[index];
                            if (task['completed'] == 0) {
                              return TaskItem(
                                taskName: task['taskName'],
                                taskTime: task['taskTime'],
                                taskDate: task['taskDate'],
                                completed: task['completed'] == 1,
                                category: task['category'],
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                          separatorBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: 1.0,
                            color: Colors.grey[300],
                          ),
                          itemCount: cubit.tasks.length,
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
                            final task = cubit.tasks[index];
                            if (task['completed'] == 1) {
                              return TaskItem(
                                taskName: task['taskName'],
                                taskTime: task['taskTime'],
                                taskDate: task['taskDate'],
                                completed: task['completed'] == 1,
                                category: task['category'],
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                          separatorBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: 1.0,
                            color: Colors.grey[300],
                          ),
                          itemCount: cubit.tasks.length,
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
          } else {
            return const Center(child: Text("Failed to load tasks"));
          }
        },
      ),
    );
  }
}
