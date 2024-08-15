import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/task_repo.dart';

class AlertDialogCubit extends Cubit<String> {
  AlertDialogCubit() : super('');
  var taskRepo = TaskRepository();

  Future<void> addTask(String task) async {
    await taskRepo.addTask(task);
    taskRepo.getTask();
  }
}
