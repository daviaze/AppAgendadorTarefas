import 'package:flutter/material.dart';

import '../pages/page_tarefas.dart';
import 'btt_card_tarefas.dart';

class CardTarefas extends StatefulWidget {
  final String nome;
  final int level;
  final VoidCallback updateLevel;
  const CardTarefas(
      {Key? key, required this.nome, required this.updateLevel, required this.level})
      : super(key: key);

  @override
  State<CardTarefas> createState() => _CardTarefasState();
}

class _CardTarefasState extends State<CardTarefas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            clipBehavior: Clip.hardEdge,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    color: Color(0xffE6E6E6),
                    height: 150,
                    width: 100,
                  ),
                  Container(
                    color: Colors.white,
                    height: 150,
                    width: 260,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 140,
                          child: Text(widget.nome,
                              style: TextStyle(
                                  fontSize: 23,
                                  overflow: TextOverflow.ellipsis)),
                        ),
                        BttCardTarefas(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.arrow_drop_up,
                                  color: Colors.white),
                              Text(
                                "Lvl Up",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          onTap: () {
                            widget.updateLevel();
                          },
                          height: 63,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: LinearProgressIndicator(
                    value: widget.level / 100,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                    backgroundColor: Colors.white70,
                  ),
                ),
                Text(
                  "Nível: " + widget.level.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
