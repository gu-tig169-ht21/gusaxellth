// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, no_logic_in_create_state, unnecessary_this, prefer_const_constructors_in_immutables, deprecated_member_use, unused_import, annotate_overrides, sized_box_for_whitespace, file_names

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
        title: Text(
          'Add something to the list',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 50),
            TextField(
              textAlign: TextAlign.center,
              controller: textEditingController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                  fillColor: Colors.orange,
                  hintText: 'Add something here',
                  hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 160,
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('Spara', style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Navigator.pop(context, NewTask(message: message));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
