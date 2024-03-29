import 'package:app_tareas/models/tasks.dart';
import 'package:app_tareas/views/pages/TaskPage.dart';
import 'package:flutter/material.dart';
import 'package:app_tareas/controller/taskProvider.dart';
import 'package:app_tareas/views/widgets/taskFormField.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  String title = "Lista de tareas";
  late TaskProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);

    return Scaffold(
      appBar: mainAppBar(),
      body: Consumer<TaskProvider>(
        builder: (_, TaskProvider, child) {
          provider = TaskProvider;
          return getListView(TaskProvider, context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateTaskPage(),
            ),
          );
        },
        child: const Icon(Icons.note_add_outlined, color: Colors.white),
      ),
    );
  }

  Widget getListView(TaskProvider provider, BuildContext context) {
    List<Task> tasks = provider.tasks;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (_, index) {
          Task task = tasks[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskPage(task: task),
                ),
              );
            },
            child: taskWidget(task),
          );
        },
      ),
    );
  }

  Widget taskWidget(Task task) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: getColor(task.color),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      task.name.length > 20
                          ? "${task.name.substring(0, 20)}..."
                          : task.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                provider.updateTask(task);
              },
              icon: task.done
                  ? const Icon(Icons.check_circle_outline)
                  : const Icon(Icons.circle_outlined),
            ),
            IconButton(
              onPressed: () {
                provider.deleteTask(task);
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}

AppBar mainAppBar() {
  return AppBar(
    title: const Text(
      "Tareas",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    ),
    backgroundColor: Colors.black87,
    elevation: 5,
  );
}
