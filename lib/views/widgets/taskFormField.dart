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
        ));
  }

  Form formTask(TaskProvider provider, BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) => task.name = value,
            decoration: const InputDecoration(labelText: "Titulo"),
            validator: _nameValidator,
          ),
          TextFormField(
            onChanged: (value) => task.description = value,
            decoration: const InputDecoration(labelText: "Descripcion"),
            validator: _descriptionValidator,
          ),
          TaskButtons(),
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
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
      backgroundColor: const MaterialStatePropertyAll(Colors.black54),
      textStyle: const MaterialStatePropertyAll(TextStyle(color: Colors.white)),
    );
  }

  String? _nameValidator(value) {
    return value == null || value.isEmpty
        ? 'Ingrese el nombre de la tarea'
        : null;
  }

  String? _descriptionValidator(value) {
    return value == null || value.isEmpty
        ? 'Ingrese la descripcion de la tarea'
        : null;
  }

  //A custom radiobutton that changes the pointer when clicked
}
