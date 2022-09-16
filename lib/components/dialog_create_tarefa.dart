import 'package:flutter/material.dart';

class DialogCreateTarefa extends StatelessWidget {
  const DialogCreateTarefa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Nome da tarefa"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Imagem"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

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
