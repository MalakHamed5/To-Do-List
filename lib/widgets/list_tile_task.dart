// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:to_do_list/core/config/theme/get_light_theme.dart';

class ListTileTask extends StatelessWidget {
  final Widget taskName;
  final bool taskCompleted;
  final void Function(bool?)? onChanged;
  const ListTileTask({
    super.key,
    required this.taskCompleted,
    required this.taskName,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20, top: 20, left: 25, right: 25),
      child: Container(
        color: getLightTheme().primaryColor,
        padding: EdgeInsets.all(24.0),
        child: Row(
          children: [
            //check box
            Checkbox(value: taskCompleted, onChanged: onChanged),
            //name task
            taskName,
          ],
        ),
      ),
    );
  }
}
