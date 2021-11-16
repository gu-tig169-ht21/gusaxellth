// ignore_for_file: prefer_const_constructors, annotate_overrides, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyState extends ChangeNotifier {
  int _counter = 0;

  void increment() {
    _counter = _counter + 1;
    notifyListeners();
  }

  int get counter => _counter;
}

class ThirdView extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyState(),
      builder: (context, child) => Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 218, 173),
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("How many times have you pressed the button?"),
              Consumer<MyState>(
                builder: (context, state, child) =>
                    Text("${state.counter}", style: TextStyle(fontSize: 36)),
              ),
              CounterIndicator(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Provider.of<MyState>(context, listen: false).increment();
          },
        ),
      ),
    );
  }
}

class CounterIndicator extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<MyState>(builder: (context, state, child) {
      if (state.counter < 10) {
        return Text('counter is less than 10');
      }
      return Text('Counter is greater or equal than 10');
    });
  }
}
