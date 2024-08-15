import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myapp/data/dao.dart';
import 'package:myapp/ui/cubit/alert_dialog_cubit.dart';
import 'package:myapp/ui/cubit/home_page_cubit.dart';
import '../widgets/alert_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageCubit()..getTask()),
        BlocProvider(create: (context) => AlertDialogCubit())
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Home Page'),
        ),
        body: BlocConsumer<HomePageCubit, List<taskDao>>(
          listener: (context, state) {
            context.read<HomePageCubit>().getTask();
          },
          builder: (context, task) {
            if (task.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: task.length,
                  itemBuilder: (context, index) {
                    var tasks = task[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (_) {
                                context
                                    .read<HomePageCubit>()
                                    .deleteTask(tasks.Id);
                              },
                              icon: Icons.delete,
                              backgroundColor: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: ListTile(
                            title: Text(tasks.Task),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(child: Text("No Tasks"));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await showDialog<String>(
              context: context,
              builder: (context) {
                final controller = TextEditingController();
                return  CustomAlertDialog(controller: controller);
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
