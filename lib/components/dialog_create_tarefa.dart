import 'package:flutter/material.dart';

class DialogCreateTarefa extends StatelessWidget {
  final Function criarTarefa;
  const DialogCreateTarefa({Key? key, required this.criarTarefa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nomeTarefaController = TextEditingController();
    TextEditingController dificuldadeController = TextEditingController();


    return SingleChildScrollView(//SingleChildScrollView faz com que quando o teclado é acionado, ele não exprema o container, podendo causar assim um overflow, ele irá deixar o container rolável quanto o teclado for acionado
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nomeTarefaController,
            decoration: const InputDecoration(hintText: "Nome da tarefa"),
          ),
          TextFormField(
            controller: dificuldadeController,
            decoration: const InputDecoration(hintText: "Dificuldade"),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              criarTarefa(nomeTarefaController.text, int.parse(dificuldadeController.text));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [

                Text("Criar"),
              ],
            ),
            /*style: ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.only(left: 90, right: 90),
              ),
            ),*/
          )
        ],
      ),
    );
  }
}
