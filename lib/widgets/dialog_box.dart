// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/my_button.dart';

import '../core/constant/app_colors.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCansel;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCansel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: AppColors.primaryColor,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //getuser
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            // buttoms => save   , cansel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                MyButton(text: "Cansel", onPressed: onCansel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
