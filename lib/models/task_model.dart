// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;
   @HiveField(1)
  final String text;
   @HiveField(2)
  final bool isCompelete;

   TaskModel(
      {required this.id, required this.text, this.isCompelete = false});

 
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
