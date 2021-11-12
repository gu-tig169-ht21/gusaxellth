// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(ThorsApp());
}

// ignore: use_key_in_widget_constructors
class ThorsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tig169'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            },
          ),
        ],
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return ListView(
      children: [
        _item("Plugga"),
        _item("tvatta"),
        _item("Handla"),
        _item("festa"),
        _item("DIska"),
      ],
    );
  }

  Widget _item(strText) {
    return ListTile(
      leading: Icon(Icons.check_box_outline_blank),
      title: Text(strText),
      trailing: Icon(Icons.highlight_remove),
    );
  }
}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new items'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 20),
            _nameInputField(),
            Container(height: 20),
            _addText(),
          ],
        ),
      ),
    );
  }

  Widget _nameInputField() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        decoration: InputDecoration(hintText: "Your name:"),
      ),
    );
  }

  Widget _addText() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 180),
          child: Icon(Icons.add),
        ),
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Text("Add"),
        )
      ],
    );
  }
}
