import 'package:app_tareas/controller/taskController.dart';
import 'package:app_tareas/models/tasks.dart';
import 'package:app_tareas/views/pages/TaskForm.dart';
import 'package:app_tareas/views/pages/TaskPage.dart';
import 'package:app_tareas/views/widgets/TaskTitle.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Tareas",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.indigo.shade400,
          elevation: 5),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.note_add_rounded),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => TaskForm()));
        },
      ),
      body: getBody(context),
    );
  }

  getBody(BuildContext context) {
    List<Task> tasks = getTasks();
    List<Widget> tasksWidget = [];
    for (Task task in tasks) {
      tasksWidget.add(
        InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TaskPage(task: task)));
            },
            child: getTaskTitle(task)),
      );
    }
    return ListView(children: tasksWidget);
  }
}
