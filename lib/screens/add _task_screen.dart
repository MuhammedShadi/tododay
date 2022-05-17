import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final  Function addTaskCallBack;
   AddTaskScreen(this.addTaskCallBack);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              "Add New Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.indigo[400],
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
           TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText){
                newTaskTitle = newText;
            },
          ),
          const SizedBox(height: 30,),
          TextButton(
            onPressed: () {
              addTaskCallBack(newTaskTitle);
            },
            child: const Text(
              "Add",
            ),
            style: TextButton.styleFrom(
                backgroundColor: Colors.teal[400], primary: Colors.white),
          ),
        ],
      ),
    );
  }
}
