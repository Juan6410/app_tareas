import 'package:app_tareas/models/tasks.dart';
import 'package:flutter/material.dart';

List<Task> getTasks() {
  return [
    Task(
        name: "Prueba 1",
        description: "Primera Nota de prueba",
        color: Colors.blue),
    Task(name: "Nota 2", description: "Segunda nota", color: Colors.deepPurple)
  ];
}
