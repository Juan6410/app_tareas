import 'package:app_tareas/controller/taskController.dart';
import 'package:app_tareas/models/tasks.dart';
import 'package:app_tareas/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:app_tareas/controller/taskProvider.dart';
import 'package:provider/provider.dart';

class CreateTaskPage extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey();
  Task task = Task.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nueva Tarea"),
      ),
      body: Consumer<TaskProvider>(
        builder: (_, contactProvider, child) {
          return formTask(contactProvider, context);
        },
      ),
    );
  }

  Widget formTask(TaskProvider provider, BuildContext context) {
    return Form(
      key: _key,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => task.name = value,
              decoration: const InputDecoration(labelText: "Titulo"),
              maxLines: 1, // Permitir múltiples líneas de texto
            ),
            TextFormField(
              onChanged: (value) => task.description = value,
              decoration: const InputDecoration(labelText: "Descripcion"),
              maxLines: 1, // Permitir múltiples líneas de texto
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TaskButtons(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    style: buttonStyle(),
                    onPressed: () {
                      task.color = TaskButtons().getEngColor() ?? '';
                      (saveTask(_key, task, provider));
                      if (_key.currentState!.validate()) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Guardar",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    style: buttonStyle(),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancelar",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.black54),
      textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
    );
  }
}
