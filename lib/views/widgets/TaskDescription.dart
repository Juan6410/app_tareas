import 'package:app_tareas/models/tasks.dart';
import 'package:flutter/material.dart';

Widget getTaskDescription(Task task) {
  return Column(
    children: [
      Container(
          width: double.infinity,
          margin: const EdgeInsets.all(5.5),
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(7.0)),
          padding: const EdgeInsets.all(5.0),
          child: Text(
            task.description,
            style: const TextStyle(fontSize: 15.0),
          ))
    ],
  );
}
