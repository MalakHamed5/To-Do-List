import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart' show Hive, Box;
import 'package:to_do_list/models/task_model.dart';

class TaskRepo {
  late final Box<TaskModel> box;

  TaskRepo() {
    try {
      box = Hive.box('taskBox');
      log('TaskRepo: Box initialized successfully');
    } catch (e) {
      log('TaskRepo: Error initializing box: $e');
    }
  }

  Future<List<TaskModel>> loadTasks() async {
    try {
      final tasks = box.values.toList();
      log('TaskRepo: Loaded ${tasks.length} tasks');
      return tasks;
    } catch (e) {
      log('Error loading tasks: $e');
      return [];
    }
  }

  Future<void> addTask(TaskModel task) async {
    try {
      await box.put(task.id, task);
      log('TaskRepo: Added task with ID: ${task.id}');
    } catch (e) {
      log('Error adding task: $e');
    }
  }

  Future<void> deletTask(String id) async {
    try {
      await box.delete(id);
      log('TaskRepo: Deleted task with ID: $id');
    } catch (e) {
      log('Error deleting task: $e');
    }
  }

  Future<void> toggleTask(String id) async {
    try {
      final task = box.get(id);

      if (task != null) {
        final update = task.copyWith(isCompelete: !task.isCompelete);
        await box.put(update.id, update);
        log('TaskRepo: Toggled task with ID: $id');
      }
    } catch (e) {
      log('Error toggling task: $e');
    }
  }
}
