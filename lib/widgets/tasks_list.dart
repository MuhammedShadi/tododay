import 'package:flutter/material.dart';
import 'package:tododay/models/task_data.dart';
import 'package:tododay/widgets/task_list.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.tasks.length,
            itemBuilder: (context, index) {
              return TaskList(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkBoxChange: (newValue) {
                 taskData.updateTask(taskData.tasks[index]);
                }, listTileDelete: () { taskData.deleteTask(taskData.tasks[index]); },
              );
            });
      },
    );
  }
}
