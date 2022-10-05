import 'package:agendador_tarefas_flutter/components/dialog_create_tarefa.dart';
import 'package:agendador_tarefas_flutter/data/database_tarefas.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    SqlData.getDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
        child: FutureBuilder(
          future: SqlData.getTarefas(),
          builder: (_, index) {
            int? len = index.data?.length;
            List<Tarefa>? tarefas = [];
            tarefas = index.data?.toList();
            //item.forEach((i)
            //{
              return ListView.builder(
                itemCount: len,
                itemBuilder: (_, index) {
                  return CardTarefas(
                    nome: tarefas?[index]?.nome ?? "",
                    updateLevel: () {
                      setState(() {
                        if (tarefas![index].level! < 10 * tarefas[index].dificuldade!) {
                          SqlData.updateTarefa(tarefas[index].ID, tarefas[index].level! + 1);
                        }else {
                          showDialog(
                              context: context,
                              builder: (_) =>
                                  AlertDialog(
                                    backgroundColor: Colors.transparent,
                                    content: SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.8,
                                      child: Lottie.asset(
                                        'assets/images/congratulations-2.json',
                                        width: 60,
                                        height: 200,
                                        fit: BoxFit.scaleDown,
                                        repeat: false,
                                        reverse: false,
                                        animate: true,
                                      ),
                                    ),
                                  ));
                        }
                      });
                    },
                    level: tarefas?[index].level ?? 0,
                    dificuldade: tarefas?[index].dificuldade ?? 0,
                  );
                }
            );
            //});
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
