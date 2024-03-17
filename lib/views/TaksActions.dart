import 'package:app_tareas/models/tasks.dart';
import 'package:flutter/material.dart';

Widget taskAction(Task task) {
  return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [Text("Cancelar"), Text("Guardar")]);
}
