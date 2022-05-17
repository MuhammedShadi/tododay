import 'package:flutter/material.dart';
import 'package:tododay/screens/add%20_task_screen.dart';
import 'package:tododay/widgets/tasks_list.dart';

import '../models/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  List<Task> tasks = [
    Task(name: "Shopping"),
    Task(name: "Working"),
    Task(name: "GYM"),
    Task(name: "Market"),
    Task(name: "Market"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modalBottomSheet(context);
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.teal[600],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20,
            bottom: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.playlist_add_check,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "ToDoDay",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children:  [
                  Text(
                    "${tasks.length} Tasks",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height - 180,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: TasksList(tasks),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future modalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskScreen((newTaskTitle){
            setState(() {
              tasks.add(Task(name: newTaskTitle));
              Navigator.pop(context);
            });
          }),
        ),
      ),
    );
  }

}

