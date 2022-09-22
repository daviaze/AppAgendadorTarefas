import 'package:agendador_tarefas_flutter/components/dialog_create_tarefa.dart';
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
          itemCount: lista.length,
          itemBuilder: (_, index) {
            final item = lista[index];
            return CardTarefas(
              nome: item.nome!,
              updateLevel: () {
                setState(() {
                  if (lista[index].level! < 10 * lista[index].dificuldade!) {
                    lista[index] = item..level = item.level! + 1;
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
                child: DialogCreateTarefa(
                  criarTarefa: (String nome, int dificuldade) {
                    setState(() {
                      lista.add(Tarefa(nome, 0, dificuldade));
                    });
                  },
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
