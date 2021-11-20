// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, no_logic_in_create_state, unnecessary_this, prefer_const_constructors_in_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import './model.dart';

class AddNewTaskView extends StatefulWidget {
  final NewTask task;

  AddNewTaskView(this.task);

  @override
  State<StatefulWidget> createState() {
    return AddNewTaskViewState(task);
  }
}

class AddNewTaskViewState extends State<AddNewTaskView> {
  late String message;

  late TextEditingController textEditingController;

  AddNewTaskViewState(NewTask task) {
    this.message = task.message;

    textEditingController = TextEditingController(text: task.message);

    textEditingController.addListener(() {
      setState(() {
        message = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add something to the list'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 20),
            TextField(
              textAlign: TextAlign.center,
              controller: textEditingController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                  fillColor: Colors.blueGrey,
                  hintText: 'Vad ska vi göra nu?',
                  hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            ElevatedButton(
              child: Text('Spara', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pop(context, NewTask(message: message));
              },
            )
          ],
        ),
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
}
