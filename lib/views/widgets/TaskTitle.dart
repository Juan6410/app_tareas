import 'package:app_tareas/models/tasks.dart';
import 'package:app_tareas/views/pages/TaskPage.dart';
import 'package:flutter/material.dart';

Widget getTaskTitle(Task task) {
  return format(task);
}

Widget format(Task task) {
  return Column(children: [
    Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: const EdgeInsets.all(7.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: BoxBorder.lerp(Border.all(color: Colors.black, width: 1.0),
            Border.all(color: Colors.white, width: 1.0), 7.5),
        color: getColor(task.color),
        backgroundBlendMode: BlendMode.softLight,
      ),
      padding: const EdgeInsets.all(6.0),
      child: Text(task.name,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: Colors.white,
          )),
    )
  ]);
}
