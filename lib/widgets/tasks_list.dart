import 'package:flutter/material.dart';
import 'package:tododay/widgets/task_list.dart';

import '../models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  TasksList(this.tasks) ;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskList(
            taskTitle: widget.tasks[index].name,
            isChecked: widget.tasks[index].isDone,
            checkBoxChange: (newValue) {
              setState(() {
                widget.tasks[index].donChange();
              });
            },
          );
        });
  }
}
