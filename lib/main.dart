import 'package:flutter/material.dart';
import 'package:tasks/components/card.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(208, 221, 237, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(47, 128, 237, 1),
          title: const Text(
            'Tarefas',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        body: const Column(
          children: [
            TaskCard('Correr'),
            TaskCard('Pular'),
          ],
        ),
      ),
    );
  }
}
