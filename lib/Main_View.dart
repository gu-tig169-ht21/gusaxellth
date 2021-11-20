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
        actions: [
          PopupMenuButton(
              onSelected: (int value) {
                if (value != null)
                  Provider.of<MyState>(context, listen: false)
                      .setFilterBy(value);
              },
              itemBuilder: (context) => [
                    // ignore: prefer_const_constructors
                    PopupMenuItem(child: Text('Alla uppgifter'), value: 0),
                    PopupMenuItem(child: Text('Färdiga uppgifter'), value: 1),
                    PopupMenuItem(child: Text('Ofärdiga uppgifter'), value: 2)
                  ]),
        ],
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
