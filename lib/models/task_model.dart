class TaskModel {
  final int id;
  final String text;
  final bool isCompelete;

  TaskModel({required this.id, required this.text, required this.isCompelete});

  TaskModel copyWith({
    String? text,
    int? id,
    bool? isCompelete,
  }) {
    return TaskModel(
        id: id ?? this.id,
        text: text ?? this.text,
        isCompelete: isCompelete ?? this.isCompelete);
  }
}
