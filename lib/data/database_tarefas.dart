import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/tarefa.dart';

const String create_table = "CREATE TABLE tarefas (ID INTEGER PRIMARY KEY,"
    " nome TEXT, level INTEGER, dificuldade INTEGER)";

class SqlData {
  static Future<Database> getDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'databaseTasks.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(create_table);
        }, onOpen: (db) async {});
    return database;
  }

  static Future<void> insertTarefa(Tarefa tarefa) async {
    await getDatabase().then((value) async {
      await value.rawInsert("INSERT INTO tarefas (nome, level, dificuldade) "
          "VALUES ('${tarefa.nome}', ${tarefa.level}, ${tarefa.dificuldade})");
    });
  }

  static Future<void> updateTarefa(int id, int level) async{
    await getDatabase().then((db) {
      db.rawUpdate("UPDATE tarefas SET level =${level} WHERE id = ${id}");
    });
  }

  static Future<List<Tarefa>> getTarefas() async {
     return await getDatabase().then((db) => db.rawQuery('SELECT * FROM tarefas').then((maps) {
          final List<Tarefa> tarefas = [];
          for(Map<String, dynamic> map in maps){
            final String nome = map['nome'];
            final int level = map['level'];
            final int dificuldade = map['dificuldade'];
            final int id = map['ID'];
            final Tarefa tarefa = Tarefa(nome, level, dificuldade, id);
            tarefas.add(tarefa);
          }
          return tarefas;
        }));
     return [];
  }
}
