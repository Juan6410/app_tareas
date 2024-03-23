import 'package:app_tareas/models/tasks.dart';
import 'package:flutter/foundation.dart';

class TaskProvider extends ChangeNotifier {
  // Lista privada
  List<Task> _tasks = [];

// Lista pública
  List<Task> get tasks => _tasks;

  addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    if (task.done == true) {
      task.done = false;
    } else {
      task.done = true;
    }
    notifyListeners();
  }
}
