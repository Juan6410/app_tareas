import 'package:app_tareas/controller/taskController.dart';
import 'package:app_tareas/models/tasks.dart';
import 'package:app_tareas/views/pages/TaskList.dart';
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
    return Scaffold(appBar: mainAppBar(), body: getBody(task));
  }
}

Center getBody(Task task) {
  return Center(
    child: Card(
      margin: const EdgeInsets.all(4.0),
      color: getColor(task.color),
      child: Column(
        children: [getTaskTitle(task), getTaskDescription(task)],
      ),
    ),
  );
}

Color getColor(String color) {
  switch (color) {
    case "red":
      return Colors.red.shade400;
    case "blue":
      return Colors.blue.shade400;
    case "green":
      return Colors.green.shade400;
    case "yellow":
      return Colors.yellow.shade400;
    case "orange":
      return Colors.orange.shade400;
    case "purple":
      return Colors.purple.shade400;
    default:
      return Colors.white30;
  }
}
