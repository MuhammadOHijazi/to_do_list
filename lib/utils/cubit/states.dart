abstract class ToDoStates{}

class ToDoInitialState extends ToDoStates{}

class ToDoCompletedState extends ToDoStates{

  late final bool completed;
  ToDoCompletedState(this.completed);
}
class ToDoNotCompletedState extends ToDoStates{

  late final bool completed;
  ToDoNotCompletedState(this.completed);
}


class ToDoLoadingState extends ToDoStates {}

class ToDoLoadedState extends ToDoStates {
  final List<Map<String, dynamic>> tasks;

  ToDoLoadedState(this.tasks);
}