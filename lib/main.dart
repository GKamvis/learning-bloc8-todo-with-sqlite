
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/ui/cubit/home_page_cubit.dart';
import 'package:myapp/ui/wiew/home_page.dart';

import 'ui/cubit/alert_dialog_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomePageCubit()),
        BlocProvider(create: (_) => AlertDialogCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Deaaüeaüeaümo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 133, 171, 27)),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}
