import 'package:myapp/data/dao.dart';
import 'package:myapp/sqlite/db_helper.dart';

class TaskRepository {
Future<List<taskDao>> getTask() async {
  var db = await DbHelper.openDb();
  List<Map<String, dynamic>> taskMap = await db.rawQuery("Select * from ToDo");

  // ignore: avoid_print
  print("Database Results: $taskMap");

  return List.generate(taskMap.length, (i) {
    var row = taskMap[i];
    return taskDao(Id: row['Id'], Task: row['Task']);
  });
}

  Future<void> addTask(String task) async {
    var db = await DbHelper.openDb();

    var data = <String, dynamic>{};

    data['Task'] = task;

    await db.insert('ToDo', data);
  }

  Future<void> deleteTask(int id) async {
    var db = await DbHelper.openDb();

    await db.delete('ToDo', where: 'id = ?', whereArgs: [id]);
  }
}
