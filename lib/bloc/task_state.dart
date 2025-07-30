part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  final List<TaskModel> taskList;

  const TaskState(this.taskList);

  @override
  List<Object?> get props => [taskList];
}

class TaskInitial extends TaskState {
  TaskInitial() : super([]);
}

class UpdateTask extends TaskState {
  const UpdateTask(super.taskList);
}
