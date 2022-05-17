import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  bool isChecked;
  String taskTitle;
  final void Function(bool?) checkBoxChange;  final void Function() listTileDelete;
  TaskList({required this.isChecked,required this.taskTitle,required this.checkBoxChange,required this.listTileDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.teal[400],
        value: isChecked,
        onChanged: checkBoxChange,
      ),
      onLongPress: listTileDelete,
    );
  }
}
