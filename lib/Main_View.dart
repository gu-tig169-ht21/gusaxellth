// ignore_for_file: prefer_const_constructors, duplicate_ignore, curly_braces_in_flow_control_structures, annotate_overrides, use_key_in_widget_constructors, unnecessary_null_comparison, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Task_Lists.dart';
import 'add_new_task_view.dart';
import 'model.dart';

class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIG169: Att göra'),
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            TasksList(_filterList(state.list, state.filterBy)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var newItem = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNewTaskView(NewTask(message: ''))));
          if (newItem != null) {
            Provider.of<MyState>(context, listen: false).addTask(newItem);
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              tooltip: 'Sort by all',
              icon: const Icon(
                Icons.favorite,
                size: 30,
              ),
              onPressed: () {
                Provider.of<MyState>(context, listen: false).setFilterBy(0);
              },
            ),
            Container(
              height: 60,
              width: 60,
            ),
            IconButton(
              tooltip: 'Sort by finished',
              icon: const Icon(Icons.check_box),
              onPressed: () {
                Provider.of<MyState>(context, listen: false).setFilterBy(1);
              },
            ),
            Container(
              height: 60,
              width: 60,
            ),
            IconButton(
              tooltip: 'Sort by unfinished',
              icon: const Icon(Icons.check_box_outline_blank),
              onPressed: () {
                Provider.of<MyState>(context, listen: false).setFilterBy(2);
              },
            ),
          ],
        ),
      ),
    );
  }

  List<NewTask> _filterList(list, value) {
    if (value == 0) return list;
    if (value == 1)
      return list.where((task) => task.isCompleted == true).toList();
    else if (value == 2)
      return list.where((task) => task.isCompleted == false).toList();

    return list;
  }
}
