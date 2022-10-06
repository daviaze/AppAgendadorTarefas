import 'package:agendador_tarefas_flutter/daos/tarefas_dao.dart';
import 'package:flutter/material.dart';

import '../models/tarefa.dart';

class TarefaProvider extends InheritedWidget {
  TarefaProvider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Tarefa> listaTarefas = [];

  static void newTarefa(String nome, int level, int dificuldade){
    TarefaDao.insertTarefa(Tarefa(nome, level, dificuldade, 0));
  }

  static Future<List<Tarefa>> getTarefas(){
    return TarefaDao.getTarefas();
  }

  static Future<void> updateTarefa(int id, int level)async {
    TarefaDao.updateTarefa(id, level);
  }

  static TarefaProvider of(BuildContext context) {
    final TarefaProvider? result = context.dependOnInheritedWidgetOfExactType<TarefaProvider>();
    assert(result != null, 'No TarefaInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TarefaProvider old) {
    return old.listaTarefas.length != listaTarefas;
  }
}
