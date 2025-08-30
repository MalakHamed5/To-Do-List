import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/models/task_model.dart';
import 'package:to_do_list/repo/task_repo.dart';
import 'package:uuid/uuid.dart';
import 'dart:developer';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepo repo;
  TaskBloc(this.repo) : super(TaskInitial()) {
    log('TaskBloc: Constructor called');

    on<LoadTasksEvent>((event, emit) async {
      log('TaskBloc: LoadTasksEvent received');
      final tasks = await repo.loadTasks();
      log('TaskBloc: Loaded ${tasks.length} tasks from repo');
      emit(UpdateTask(List.from(tasks)));
      log('TaskBloc: Emitted UpdateTask state');
    });

    on<AddTaskEvent>((event, emit) async {
      log('TaskBloc: AddTaskEvent received with text: ${event.text}');
      final task = TaskModel(id: Uuid().v4(), text: event.text.toString());
      //add in hive
      await repo.addTask(task);
      //add in bloc
      final tasks = await repo.loadTasks();
      log('TaskBloc: Emitting UpdateTask with ${tasks.length} tasks after adding');
      emit(UpdateTask(tasks));
    });

    on<DeleteTaskEvent>((event, emit) async {
      log('TaskBloc: DeleteTaskEvent received for ID: ${event.id}');
      //delet from hive
      await repo.deletTask(event.id);
      final tasks = await repo.loadTasks();
      //delete from bloc
      emit(UpdateTask(tasks));
    });

    on<ToggleTaskEvent>((event, emit) async {
      log('TaskBloc: ToggleTaskEvent received for ID: ${event.id}');
      //toggle in hive
      await repo.toggleTask(event.id);
      final tasks = await repo.loadTasks();
      //toggle in bloc
      emit(UpdateTask(tasks));
    });
  }
}
