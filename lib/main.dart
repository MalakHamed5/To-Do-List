import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/bloc/task_bloc.dart';
import 'package:to_do_list/core/config/theme/theme_data/get_light_theme.dart';
import 'package:to_do_list/models/task_model.dart';
import 'package:to_do_list/repo/task_repo.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init
  await Hive.initFlutter();
  //regester
  Hive.registerAdapter(TaskModelAdapter());
  //box
  await Hive.openBox<TaskModel>('taskBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = TaskRepo();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(repo)..add(LoadTasksEvent()),
        ),
      ],
      child: MaterialApp(
        theme: getLightTheme(),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
