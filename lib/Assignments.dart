// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, annotate_overrides, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class TasksList extends StatelessWidget {
  final List<NewTask> list;

  TasksList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((task) => _taskItem(context, task)).toList());
  }

  Widget _taskItem(context, task) {
    var state = Provider.of<MyState>(context, listen: false);
    return Container(
        padding: EdgeInsets.only(),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
        ),
        child: CheckboxListTile(
          title: Text(
            task.message,
            style: (TextStyle(
              fontSize: 20,
              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
              decorationThickness: 1,
            )),
          ),
          secondary: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              var state = Provider.of<MyState>(context, listen: false);
              state.removeTask(task);
            },
          ),
          controlAffinity: ListTileControlAffinity.leading,
          value: task.isCompleted,
          onChanged: (value) {
            state.isCompleted(task);
          },
        ));
  }
}

class TaskView extends StatelessWidget {
  final NewTask task;
  TaskView(this.task);

  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}
