import 'package:agendador_tarefas_flutter/components/dialog_create_tarefa.dart';
import 'package:agendador_tarefas_flutter/daos/tarefas_dao.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../components/card_lista_tarefas.dart';
import '../providers/tarefa_provider.dart';
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
    TarefaDao.getDatabase();
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
        child: FutureBuilder(
          //FutureBuilder<List<Tarefa>> especifica o tipo do initialData
          //initialData: [], // pode-se utilizar o initial daos para resolver o problema da inicialização nula no future builder
          future: Future.delayed(const Duration(seconds: 1))
              .then((value) => TarefaProvider.getTarefas()),
          builder: (_, snapshot) {
            /*switch(snapshot.connectionState){

              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                /*return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                    ],
                  ),
                );                break;*/
                break;
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
              case ConnectionState.done:

            }*/
            //return Text('Erro ao carregar lista');
            int? len = snapshot.data?.length;
            List<Tarefa>? tarefas = [];
            tarefas = snapshot.data?.toList();

            if (snapshot.data != null) {
              //outra opção para resolver o problema do future builder
              return Container(
                margin: const EdgeInsets.only(bottom: 45),
                child: ListView.builder(
                    itemCount: len,
                    itemBuilder: (_, index) {
                      return CardTarefas(
                        nome: tarefas?[index].nome ?? "",
                        updateLevel: () {
                          setState(() {
                            if (tarefas![index].level! <
                                10 * tarefas[index].dificuldade! - 1) {
                              TarefaProvider.updateTarefa(
                                  tarefas[index].id, tarefas[index].level! + 1);
                            } else {
                              if(tarefas[index].level! ==
                                  10 * tarefas[index].dificuldade! -1){
                                TarefaProvider.updateTarefa(
                                    tarefas[index].id, tarefas[index].level! + 1);
                              }
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        backgroundColor: Colors.white,
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              child: Lottie.asset(
                                                'assets/images/congratulations-3.json',
                                                width: 60,
                                                height: 200,
                                                fit: BoxFit.scaleDown,
                                                repeat: false,
                                                reverse: false,
                                                animate: true,
                                              ),
                                            ),
                                            const Text("Missão cumprida!")
                                          ],
                                        ),
                                        actions: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Entendi")),
                                            ],
                                          )
                                        ],
                                      ));
                            }
                          });
                        },
                        level: tarefas?[index].level ?? 0,
                        dificuldade: tarefas?[index].dificuldade ?? 0,
                      );
                    }),
              );
            }
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
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
