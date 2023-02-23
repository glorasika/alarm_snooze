import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SetSnoozeScreen extends StatefulWidget {
  const SetSnoozeScreen({Key? key}) : super(key: key);

  @override
  State<SetSnoozeScreen> createState() => _SetSnoozeScreen();
}

class _SetSnoozeScreen extends State<SetSnoozeScreen> {
  int _currentSnoozeTime = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[300],
        title: const Text("Set Snooze", style: TextStyle(fontSize: 40)),
      ),
      body: SafeArea(
        child: Center(
          child: Column (
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.fromLTRB(47, 25, 47, 25),
                width: 300,
                decoration: BoxDecoration(
                  // color: Colors.,
                    border: Border.all(
                        color: Colors.deepPurple,
                        width: 3
                    )
                ),
                child: NumberPicker (
                  value: _currentSnoozeTime,
                  minValue: 1,
                  maxValue: 15,
                  step: 1,
                  itemHeight: 95,
                  itemCount: 5,
                  infiniteLoop: true,
                  textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                  selectedTextStyle: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.red),
                  onChanged: (value) => setState(() => _currentSnoozeTime = value),
                ),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
  
}