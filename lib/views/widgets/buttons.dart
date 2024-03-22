import 'package:flutter/material.dart';

class TaskButtons extends StatefulWidget {
  @override
  State<TaskButtons> createState() => _TaskButtonsState();
  //a method to call engColor
  String? getEngColor() {
    return engColor;
  }
}

String engColor = "blue";
String? colorSeleccionado = "Azul";

class _TaskButtonsState extends State<TaskButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            customRadioButton("Azul", colorSeleccionado,
                MaterialStateProperty.all(Colors.blue), "blue"),
            customRadioButton("Amarillo", colorSeleccionado,
                MaterialStateProperty.all(Colors.yellow), "yellow"),
            customRadioButton("Verde", colorSeleccionado,
                MaterialStateProperty.all(Colors.green), "green"),
            customRadioButton("Rojo", colorSeleccionado,
                MaterialStateProperty.all(Colors.red), "red")
          ],
        ),
      ),
    );
  }

  Widget customRadioButton(String? value, String? groupValue,
      MaterialStateProperty<MaterialColor> color, String? englishColor) {
    return RadioMenuButton(
      value: value ?? '',
      groupValue: groupValue ?? '',
      style: ButtonStyle(
          backgroundColor: color,
          shape: MaterialStateProperty.all(ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)))),
      onChanged: (newValue) {
        colorSeleccionado = newValue.toString();
        engColor = engColor;
        engColor = englishColor ?? '';
        setState(() {});
      },
      child: Text(value ?? ''),
    );
  }

  //a method to return engColor
  String getEngColor2() {
    return engColor;
  }
}
