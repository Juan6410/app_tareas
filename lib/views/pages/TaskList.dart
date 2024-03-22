import 'package:app_tareas/controller/taskController.dart';
import 'package:app_tareas/models/tasks.dart';
import 'package:app_tareas/views/pages/TaskPage.dart';
import 'package:app_tareas/views/widgets/TaskTitle.dart';
import 'package:flutter/material.dart';
import 'package:app_tareas/controller/taskProvider.dart';
import 'package:app_tareas/views/widgets/taskFormField.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  String title = "Lista de contactos";
  late TaskProvider provider;

  @override
  Widget build(BuildContext context) {
    // OTRA FORMA DE ACCEDER AL PROVIDER
    provider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Tareas",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.black87,
          elevation: 5),
      body: Consumer<TaskProvider>(
        builder: (_, TaskProvider, child) {
          provider = TaskProvider;
          return getListView(TaskProvider);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la pagina de crear contacto
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateTaskPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
    // Text("CREAR UNA LISTA DENTRO DE UN SCAFFOLD");
  }

  Widget getListView(TaskProvider provider) {
    // Lista de contactos
    List<Task> tasks = provider.tasks;
    return Padding(
      padding: const EdgeInsets.all(10),
      // Lista de los widgets de los contactos
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (_, index) {
          Task task = tasks[index];
          // Retornar el widget de cada contacto
          return taskWidget(task);
        },
      ),
    );
  }

  Widget taskWidget(Task task) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        color: getColor(task.color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.name,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  task.description,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
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
