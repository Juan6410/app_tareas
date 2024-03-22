import 'package:app_tareas/models/tasks.dart';
import 'package:flutter/foundation.dart';

class TaskProvider extends ChangeNotifier {
  // Lista privada
  List<Task> _tasks = [];

// Lista pública
  List<Task> get tasks => _tasks;

  addTask(Task task) {
    print(task.color);
    _tasks.add(task);
    // Notificar a los suscriptores de que hay un cambio
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    // Notificar a los suscriptores de que hay un cambio
    notifyListeners();
  }
}
