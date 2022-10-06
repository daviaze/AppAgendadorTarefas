import 'package:agendador_tarefas_flutter/pages/page_tarefas.dart';
import 'package:flutter/material.dart';

import 'providers/tarefa_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: TarefaProvider(child: const Tarefas()),
    );
  }
}
