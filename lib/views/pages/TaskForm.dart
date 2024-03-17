import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  @override
  State<TaskForm> createState() => _TaskFormState();
}

String? colorSeleccionado = "";
// MaterialStateProperty<Color?>? selectColor =
//     MaterialStateProperty.all(Colors.white);

class _TaskFormState extends State<TaskForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customRadioButton("Azul", colorSeleccionado,
                      MaterialStateProperty.all(Colors.blue)),
                  customRadioButton("Amarillo", colorSeleccionado,
                      MaterialStateProperty.all(Colors.yellow)),
                  customRadioButton("Verde", colorSeleccionado,
                      MaterialStateProperty.all(Colors.green)),
                  customRadioButton("Rojo", colorSeleccionado,
                      MaterialStateProperty.all(Colors.red))
                ],
              ),
            )));
  }

  // Widget customRadioButton(String? value, String? groupValue) {
  //   return RadioMenuButton(
  //       value: value,
  //       groupValue: groupValue,
  //       onChanged: (value) {
  //         colorSeleccionado = value.toString();
  //         setState(() {});
  //       },
  //       child: const Text(value));
  // }

  Widget customRadioButton(String? value, String? groupValue,
      MaterialStateProperty<MaterialColor> color) {
    return RadioMenuButton(
      value: value ?? '',
      groupValue: groupValue ?? '',
      style: ButtonStyle(
          backgroundColor: color,
          shape: MaterialStateProperty.all(ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)))),
      onChanged: (newValue) {
        colorSeleccionado = newValue.toString();
        setState(() {});
      },
      child: Text(value ?? ''),
    );
  }
}
