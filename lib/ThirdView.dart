// ignore_for_file: prefer_const_constructors, annotate_overrides, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThirdView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThirdViewState();
  }
}

class ThirdViewState extends State<StatefulWidget> {
  int _counter = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 218, 173),
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("How many times have you pressed the button?"),
            Text("$_counter", style: TextStyle(fontSize: 36)),
            CounterIndicator(_counter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}

class CounterIndicator extends StatelessWidget {
  final int counter;

  CounterIndicator(this.counter);

  Widget build(BuildContext context) {
    if (counter < 10) {
      return Text('counter is less than 10');
    }
    return Text('Counter is greater or equal than 10');
  }
}
