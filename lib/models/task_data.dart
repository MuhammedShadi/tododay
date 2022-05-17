import 'package:flutter/material.dart';
import 'package:tododay/models/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> tasks = [
    Task(name: "Shopping"),
    Task(name: "Working"),
    Task(name: "GYM"),
    Task(name: "Market"),
    Task(name: "Market"),
  ];

  void addTask (String newTitle){
    tasks.add(Task(name: newTitle));
    notifyListeners();
  }

  void updateTask(Task task){
    task.donChange();
    notifyListeners();
  }

  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }
}