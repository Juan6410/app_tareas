import 'package:app_tareas/models/tasks.dart';
import 'package:flutter/material.dart';

Widget getTaskTitle(Task task) {
  return Column(
    children: [Text(task.name)],
  );
}
