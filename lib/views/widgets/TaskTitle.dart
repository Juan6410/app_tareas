import 'package:app_tareas/models/tasks.dart';
import 'package:flutter/material.dart';

Widget getTaskTitle(Task task) {
  return format(task);
}

Widget format(Task task) {
  return Column(children: [
    Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: const EdgeInsets.all(3.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: task.color,
          backgroundBlendMode: BlendMode.darken),
      padding: const EdgeInsets.all(6.0),
      child: Text(task.name,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
    )
  ]);
}

// Widget taskTitle(Task task) {
//   return Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: Row(
//         children: [Text(task.name)],
//       ));
// }
