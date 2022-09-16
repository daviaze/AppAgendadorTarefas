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
  @override
  void initState() {
    lista.add(Tarefa("Jogar lol", 10,
        "https://cdn-0.imagensemoldes.com.br/wp-content/uploads/2020/05/%C3%8Dcone-Cupcake-PNG.png"));
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
            nome: item.nome!,
            updateLevel: () {
              setState(() {
                if (lista[index].level! < 10) {
                  lista[index] = item..level = item.level! + 1;
                }
              });
            },
            level: item.level!,
            urlfoto: item.urlfoto!,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Criar Tarefa"),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.2,
                child: DialogCreateTarefa(),
              ),
            ),
          );
          /*setState(() {
            lista.add(Tarefa("comer", 1, "https://cdn-0.imagensemoldes.com.br/wp-content/uploads/2020/05/%C3%8Dcone-Cupcake-PNG.png"));
          });*/
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
