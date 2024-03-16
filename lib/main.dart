import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: getScaffold(),
    );
  }

  Scaffold getScaffold() {
    return Scaffold(
      appBar: getAppBar(),
      body: const Center(
        child: Text("a"),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: const Text(
        "Lista de Tareas",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      backgroundColor: Colors.indigo.shade400,
      elevation: 5,
      actions: [],
    );
  }
}
