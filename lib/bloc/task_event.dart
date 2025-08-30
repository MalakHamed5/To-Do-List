// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTasksEvent extends TaskEvent{}
class AddTaskEvent extends TaskEvent {
  final String text;
  AddTaskEvent({
    required this.text,
  });
}

class DeleteTaskEvent extends TaskEvent {
  final String id;

  DeleteTaskEvent({required this.id});
}

class ToggleTaskEvent extends TaskEvent {
  final String id;

  ToggleTaskEvent(this.id);
}

