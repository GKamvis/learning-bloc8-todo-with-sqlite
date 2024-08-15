
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/dao.dart';
import 'package:myapp/data/task_repo.dart';

class HomePageCubit extends Cubit<List<taskDao>> {
  HomePageCubit() : super([]);

  Future<void> getTask() async {
    emit(await TaskRepository().getTask());
  }

  Future<void> addTask(String task) async {
    await TaskRepository().addTask(task);
    getTask();
  }

  Future<void> deleteTask(int id) async {
    await TaskRepository().deleteTask(id);
    getTask();
  }
}
