import 'package:agendador_tarefas_flutter/components/dialog_create_tarefa.dart';
import 'package:flutter/material.dart';

import '../components/card_lista_tarefas.dart';
import '../data/tarefa_inherited.dart';
import '../models/tarefa.dart';

class Tarefas extends StatefulWidget {
  const Tarefas({Key? key}) : super(key: key);

  @override
  State<Tarefas> createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  double esconderLista = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  esconderLista = esconderLista == 1 ? 0 : 1;
                });
              },
              child: const Icon(Icons.remove_red_eye),
            ),
          )
        ],
      ),
      body: AnimatedOpacity(
        opacity: esconderLista,
        duration: const Duration(milliseconds: 500),
        child: ListView.builder(
          itemCount: TarefaInherited.of(context).listaTarefas.length,
          itemBuilder: (_, index) {
            final item = TarefaInherited.of(context).listaTarefas[index];
            return CardTarefas(
              nome: item.nome!,
              updateLevel: () {
                setState(() {
                  if (TarefaInherited.of(context).listaTarefas[index].level! < 10 * TarefaInherited.of(context).listaTarefas[index].dificuldade!) {
                    TarefaInherited.of(context).listaTarefas[index] = item..level = item.level! + 1;
                  }
                });
              },
              level: item.level!,
              dificuldade: item.dificuldade!,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Criar Tarefa"),
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: DialogCreateTarefa(tarefaContext: context),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
