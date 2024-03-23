import 'package:flutter/material.dart';

class Task {
  late String name;
  late String description;
  late String color;
  late bool done;

  Task(
      {required this.name,
      required this.description,
      required this.color,
      required this.done});

  Task.empty() {
    name = "";
    description = "";
    color = "";
    done = false;
  }
}
