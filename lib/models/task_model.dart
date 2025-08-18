// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String id;
  final String text;
  final bool isCompelete;

  const TaskModel(
      {required this.id, required this.text, this.isCompelete = false});

  @override
  List<Object?> get props => [id, text, isCompelete];

  TaskModel copyWith({
    String? id,
    String? text,
    bool? isCompelete,
  }) {
    return TaskModel(
      id: id ?? this.id,
      text: text ?? this.text,
      isCompelete: isCompelete ?? this.isCompelete,
    );
  }
}
