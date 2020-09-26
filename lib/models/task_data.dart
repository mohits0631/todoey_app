import 'dart:collection'; //imported here to use the unmodifiableListView property
import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
//////////////////////////////getter for the actual list itself//////////////////////////////
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

///////////////////////////////getter for tasks list length//////////////////////////////////
  int get taskCount {
    return _tasks.length;
  }

////addTask method to add new tasks with the name received from add_task_screen.dart file////
  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

///////////////////////////////getter for tasks list length//////////////////////////////////
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

/////////////////////////updateTaskStatus method to toggle the checkbox//////////////////////
  void updateTaskStatus(Task taskPassedAsArgument) {
    taskPassedAsArgument.toggleDone();
    notifyListeners();
  }
}
