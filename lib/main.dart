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
        backgroundColor: Colors.grey,
      ),
      body: _list(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SecondView();
          }));
        },
        tooltip: 'Increment',
        backgroundColor: Colors.grey[400],
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 55,
        ),
      ),
    );
  }

  Widget _list() {
    return ListView(
      children: [
        _item("Plugga"),
        _divider(),
        _item("tvatta"),
        _divider(),
        _item("Handla"),
        _divider(),
        _item("festa"),
        _doneItem("test"),
        _divider(),
        _item("DIska"),
        _divider(),
        //_newPageButton(),
      ],
    );
  }

  Widget _item(strText) {
    return ListTile(
      leading: Icon(Icons.check_box_outline_blank),
      title: Text(strText),
      trailing: Icon(Icons.clear),
    );
  }

  Widget _divider() {
    return Divider(
      height: 15,
      thickness: 1,
    );
  }

  Widget _doneItem(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.check_box_outlined),
        ),
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.lineThrough,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }
  /*Widget _newPageButton() {
    return IconButton(
      icon: Icon(Icons.add),
      
    );
  }*/

}

// SECOND SCREEN
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
