
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/alert_dialog_cubit.dart';
import '../cubit/home_page_cubit.dart';


class CustomAlertDialog extends StatelessWidget {
  final TextEditingController controller;
  const CustomAlertDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlertDialogCubit(),
      child: AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Add Task"),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
      
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // get user input
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new task",
                ),
              ),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // save button
                 ElevatedButton(
  onPressed: () {
    final task = controller.text.trim();
    if (task.isNotEmpty) {
      context.read<HomePageCubit>().addTask(task); // Yeni tapşırığı əlavə edin
      Navigator.of(context).pop(); // Dialoqu bağlayın
      controller.clear();
    }
  },
  child: const Text("Save"),
),
      
                  const SizedBox(width: 8),
      
                  // cancel button
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Calcel")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
