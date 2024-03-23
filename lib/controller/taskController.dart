import 'package:app_tareas/controller/taskProvider.dart';
import 'package:app_tareas/models/tasks.dart';
import 'package:flutter/material.dart';

// List<Task> getTasks() {
//   return [
//     Task(
//         name: "Prueba 1", description: "Primera Nota de prueba", color: "blue"),
//     Task(name: "Nota 2", description: "Segunda nota", color: "red")
//   ];
// }

Task newTask(String name, String description, String color, bool done) {
  return Task(name: name, description: description, color: color, done: done);
}

void saveTask(GlobalKey<FormState> _key, Task task, TaskProvider provider) {
  // Valido el formulario
  if (_key.currentState!.validate()) {
    // Agregar a la lista del provider
    provider.addTask(task);
  }
}
