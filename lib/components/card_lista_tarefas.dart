import 'package:agendador_tarefas_flutter/components/stars_card_tarefas.dart';
import 'package:flutter/material.dart';

import 'btt_card_tarefas.dart';

class CardTarefas extends StatefulWidget {
  final String nome;
  final int level;
  final int dificuldade;
  final VoidCallback updateLevel;
  const CardTarefas(
      {Key? key,
      required this.nome,
      required this.updateLevel,
      required this.level,
      required this.dificuldade})
      : super(key: key);

  @override
  State<CardTarefas> createState() => _CardTarefasState();
}

class _CardTarefasState extends State<CardTarefas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
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
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey.shade50,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: const Icon(
                        Icons.task_alt,
                        color: Color(0xFF029EF2),
                        size: 75,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 150,
                    width: 260,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.nome,
                                  style: const TextStyle(
                                      fontSize: 23,
                                      overflow: TextOverflow.ellipsis)),
                              StarsCard(dificuldade: widget.dificuldade),
                            ],
                          ),
                        ),
                        BttCardTarefas(
                          onTap: () {
                            widget.updateLevel();
                          },
                          height: 63,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.arrow_drop_up, color: Colors.white),
                              Text(
                                "Lvl Up",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: LinearProgressIndicator(
                    value: widget.dificuldade > 0 ? (widget.level/widget.dificuldade) / 10 : 1,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                    backgroundColor: Colors.white70,
                  ),
                ),
                Text(
                  "Nível: ${widget.level}",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
