import 'package:agendador_tarefas_flutter/data/database_tarefas.dart';
import 'package:flutter/material.dart';

import '../models/tarefa.dart';

class TarefaInherited extends InheritedWidget {
  TarefaInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Tarefa> listaTarefas = [];

  static void newTarefa(String nome, int level, int dificuldade){
    //listaTarefas.add(new Tarefa(nome, level, dificuldade));
    SqlData.insertTarefa(new Tarefa(nome, level, dificuldade, 0));
  }

  static TarefaInherited of(BuildContext context) {
    final TarefaInherited? result = context.dependOnInheritedWidgetOfExactType<TarefaInherited>();
    assert(result != null, 'No TarefaInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TarefaInherited old) {
    return old.listaTarefas.length != listaTarefas;
  }
}
