import 'package:flutter/material.dart';

import '../components/card_lista_tarefas.dart';
import '../models/tarefa.dart';

class Tarefas extends StatefulWidget {
  const Tarefas({Key? key}) : super(key: key);

  @override
  State<Tarefas> createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  List<Tarefa> lista = [];
  @override
  void initState() {
    lista.add(Tarefa("Jogar lol", 10));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (_, index) {
          final item = lista[index];
          return CardTarefas(
              nome: item.nome,
              updateLevel: () {
                setState(() {
                  lista[index] = item..level = item.level+1;
                });
              }, level: item.level,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            lista.add(Tarefa("comer", 1));
          });
        },
    child: Icon(Icons.add),
    ),
    );
  }

}
