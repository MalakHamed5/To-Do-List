import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/task_bloc.dart';
import 'package:to_do_list/core/config/theme/app_colors.dart';
import 'package:to_do_list/core/config/theme/theme_data/get_light_theme.dart';
import 'package:to_do_list/widgets/dialog_box.dart';
import 'package:to_do_list/widgets/list_tile_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return Column(
            children: [
              //List of tasks
              Expanded(
                child: ListView.builder(
                  itemCount: state.taskList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final task = state.taskList[index];
                    // Delete the task
                    return Dismissible(
                      key: ValueKey(task.id),
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: Colors.red,
                        padding: EdgeInsets.only(
                            bottom: 20, top: 20, left: 25, right: 25),
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (direction) {
                        final deleteTake = task;
                        context.read<TaskBloc>().add(
                              DeleteTaskEvent(id: task.id),
                            );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${task.text} Deleted"),
                            action: SnackBarAction(
                              label: 'Return',
                              onPressed: () {
                                context
                                    .read<TaskBloc>()
                                    .add(AddTaskEvent(text: deleteTake.text));
                              },
                            ),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                      child: ListTileTask(
                        taskCompleted: task.isCompelete,
                        taskName: Text(
                          task.text,
                          style: TextStyle(
                            fontSize: 20,
                            decoration: task.isCompelete
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        onChanged: (value) {
                          context
                              .read<TaskBloc>()
                              .add(ToggleTaskEvent(task.id));
                        },
                      ),
                    );
                  },
                ),
              ),
              //Bouttom to add task
              Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DialogBox(
                            controller: _controller,
                            onSave: () {
                              if (_controller.text.isEmpty) return;
                              context
                                  .read<TaskBloc>()
                                  .add(AddTaskEvent(text: _controller.text));
                              _controller.clear();
                              Navigator.of(context).pop();
                            },
                            onCansel: () {
                              _controller.clear();
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
