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
      body: getBody("Hola"),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("click");
          },
          backgroundColor: Colors.indigo.shade400,
          shape: CircleBorder(),
          child: const Icon(Icons.note_add_rounded)),
    );
  }

  Center getBody(String title) {
    return Center(
      child: Column(
        children: [
          TextButton(
              onPressed: () => print("Text Button"), child: Text("click"))
        ],
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
    );
  }
}
