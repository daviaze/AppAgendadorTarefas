import 'dart:io';

import 'package:agendador_tarefas_flutter/data/tarefa_inherited.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../data/database_tarefas.dart';
import '../models/tarefa.dart';

class DialogCreateTarefa extends StatefulWidget {
  const DialogCreateTarefa({Key? key, required this.tarefaContext})
      : super(key: key);

  final BuildContext tarefaContext;

  @override
  State<DialogCreateTarefa> createState() => _DialogCreateTarefaState();
}

class _DialogCreateTarefaState extends State<DialogCreateTarefa> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nomeTarefaController = TextEditingController();
    TextEditingController dificuldadeController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    var duration = const Duration(seconds: 5);

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        //SingleChildScrollView faz com que quando o teclado é acionado, ele não exprema o container, podendo causar assim um overflow, ele irá deixar o container rolável quanto o teclado for acionado
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nomeTarefaController,
              decoration: const InputDecoration(hintText: "Nome da tarefa"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Insira o nome da tarefa';
                }
                return null;
              },
            ),
            TextFormField(
              controller: dificuldadeController,
              decoration: const InputDecoration(hintText: "Dificuldade"),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Insira um valor para dificuldade';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  /*showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: Colors.transparent,
                            content: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Lottie.asset(
                                'assets/images/load_task.json',
                                width: 60,
                                height: 200,
                                fit: BoxFit.scaleDown,
                                repeat: true,
                                reverse: false,
                                animate: true,
                              ),
                            ),
                          ));*/
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Tarefa criada!"),
                    ),
                  );
                  setState(() {
                    SqlData.insertTarefa(new Tarefa(nomeTarefaController.text, 0, int.parse(dificuldadeController.text), 0));
                  });
                  Navigator.of(context).pop( );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Criar"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
