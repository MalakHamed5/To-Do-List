import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/models/task_model.dart';
import 'package:uuid/uuid.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>((event, emit) {
      final model =
          TaskModel(id: Uuid().v4() as int, text: event.text.toString());
      emit(UpdateTask([...state.taskList, model]));
    });

    on<DeleteTaskEvent>((event, emit) {
      final List<TaskModel> newList =
          state.taskList.where((task) => task.id != event.id).toList();
          
      emit(UpdateTask(newList));
    });

    on<ToggleTaskEvent>((event, emit) {
      final List<TaskModel> newList = state.taskList.map((task) {
        return task.id == event.id
            ? task.copyWith(isCompelete: !task.isCompelete)
            : task;
      }).toList();

      emit(UpdateTask(newList));
    });
  }
}
