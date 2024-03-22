import 'package:flutter/material.dart';

class Task {
  late String name;
  late String description;
  late String color;

  Task({required this.name, required this.description, required this.color});

  Task.empty() {
    name = "";
    description = "";
    color = "";
  }
}
