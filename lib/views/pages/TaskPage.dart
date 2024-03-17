import 'package:app_tareas/controller/taskController.dart';
import 'package:app_tareas/models/tasks.dart';
import 'package:app_tareas/views/widgets/TaskDescription.dart';
import 'package:app_tareas/views/widgets/TaskTitle.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  // List<Task> tasks = [];
  Task task;

  TaskPage({super.key, required this.task}) {
    // tasks = getTasks();
  }

  @override
  Widget build(BuildContext context) {
    // Task task = tasks[0];
    return Scaffold(appBar: getAppBar(), body: getBody(task));
  }
}

AppBar getAppBar() {
  return AppBar(
    title: const Text(
      "Lista de Tareas",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    ),
    backgroundColor: Colors.indigo.shade400,
    elevation: 5,
  );
}

Center getBody(Task task) {
  return Center(
    child: Card(
      margin: const EdgeInsets.all(4.0),
      color: Colors.grey.shade400,
      surfaceTintColor: task.color,
      child: Column(
        children: [getTaskTitle(task), getTaskDescription(task)],
      ),
    ),
  );
}
