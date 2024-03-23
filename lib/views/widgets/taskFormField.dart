import 'package:app_tareas/controller/taskController.dart';
import 'package:app_tareas/models/tasks.dart';
import 'package:app_tareas/views/pages/TaskList.dart';
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
        appBar: mainAppBar(),
        body: Consumer<TaskProvider>(
          builder: (_, contactProvider, child) {
            return formTask(contactProvider, context);
          },
        ));
  }

  Form formTask(TaskProvider provider, BuildContext context) {
    return Form(
      key: _key,
      child: Card(
        margin: EdgeInsetsGeometry.lerp(
            const EdgeInsets.all(6.0), EdgeInsets.zero, 0.0),
        color: Colors.white54,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      onChanged: (value) => task.name = value,
                      decoration: const InputDecoration(labelText: "Titulo"),
                      validator: _nameValidator,
                    ),
                    TextFormField(
                      onChanged: (value) => task.description = value,
                      decoration:
                          const InputDecoration(labelText: "Descripcion"),
                      validator: _descriptionValidator,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black54,
                    border: Border.all(color: Colors.black, width: 3.0),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Selecciona un color para la tarea",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    TaskButtons(),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Expanded(
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
                      const Row(
                          children: [Padding(padding: EdgeInsets.all(8.0))]),
                      Expanded(
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
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black54),
        shape: MaterialStateProperty.all(ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(8.0))));
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
}
