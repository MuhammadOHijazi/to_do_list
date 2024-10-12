import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/utils/cubit/states.dart';
import '../database.dart';

class ToDoCubit extends Cubit<ToDoStates> {
  ToDoCubit() : super(ToDoInitialState());

  static ToDoCubit get(context) => BlocProvider.of(context);

  bool? completed;

  void initializeCompletion(bool initialStatus) {
    completed = initialStatus;
    emit(ToDoCompletedState(completed!));
  }

  Future<void> toggleCompletion(String taskName, bool newStatus) async {
    completed = newStatus;
    emit(newStatus
        ? ToDoCompletedState(completed!)
        : ToDoNotCompletedState(completed!));

    // Update completion status in the database
    await ToDoDataBase.instance.updateTaskCompletionByName(taskName, newStatus);
  }

  late Database db;
  List<Map<String, dynamic>> tasks = [];

  // Method to open the database and fetch tasks
  Future<void> loadTasksFromDatabase() async {
    // Open the database (ensure you've created it somewhere else)
    db = await openDatabase(
      join(await getDatabasesPath(), 'todo.db'), // Adjust as per your database
    );

    // Fetch all tasks from the 'tasks' table
    final List<Map<String, dynamic>> taskData = await db.query('tasks');

    tasks = taskData;

    emit(ToDoLoadedState(tasks)); // Emitting the state with the loaded tasks
  }
}
