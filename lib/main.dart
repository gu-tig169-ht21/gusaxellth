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
      backgroundColor: Color.fromARGB(255, 255, 218, 173),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tig169',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        backgroundColor: Colors.orange,
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("All"),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text("Done"),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text("Undone"),
                      value: 3,
                    )
                  ])
        ],
      ),
      body: _list(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SecondView();
          }));
        },
        tooltip: 'Increment',
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 55,
        ),
      ),
    );
  }

  Widget _list() {
    var thelist = [
      "plugga",
      "diska",
      "testar",
      "testing",
    ];

    return ListView.builder(
      itemCount: thelist.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            _listItems(thelist[index]),
            Divider(thickness: 2),
          ],
        );
      },
    );
  }

  Widget _listItems(thelistTitle) {
    return ListTile(
      leading: checkBoxClass(),
      title: Text(
        thelistTitle,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
      ),
    );
  }

  /* Widget _doneItem(String name) {
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
  }*/
}

class checkBoxClass extends StatefulWidget {
  @override
  State<checkBoxClass> createState() => checkBoxClassState();
}

class checkBoxClassState extends State<checkBoxClass> {
  bool? _myBool = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: Colors.black,
        value: _myBool,
        onChanged: (value) {
          setState(() {
            _myBool = value;
          });
        });
  }
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
