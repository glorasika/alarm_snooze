import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SetSnoozeScreen extends StatefulWidget {
  const SetSnoozeScreen({Key? key}) : super(key: key);

  @override
  State<SetSnoozeScreen> createState() => _SetSnoozeScreen();
}

class _SetSnoozeScreen extends State<SetSnoozeScreen> {
  int _snoozeMinute = 5;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[300],
        title: const Text("Set Snooze", style: TextStyle(fontSize: 40, fontFamily: "Chakra", fontWeight: FontWeight.bold, letterSpacing: 1)),
      ),
      body: SafeArea(
        child: Center(
          child: Column (
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.fromLTRB(47, 22, 47, 22),
                width: 300,
                decoration: BoxDecoration(
                  // color: Colors.,
                    border: Border.all(
                        color: Colors.deepPurple,
                        width: 3
                    )
                ),
                child: NumberPicker (
                  value: _snoozeMinute,
                  minValue: 1,
                  maxValue: 15,
                  step: 1,
                  itemHeight: 95,
                  itemCount: 5,
                  infiniteLoop: true,
                  textStyle: const TextStyle(fontSize: 38, fontFamily: "Chakra", fontWeight: FontWeight.w700),
                  selectedTextStyle: const TextStyle(fontSize: 50, fontFamily: "Chakra", fontWeight: FontWeight.bold, color: Colors.red),
                  onChanged: (value) => setState(() => _snoozeMinute = value),
                ),
              ),
              Container(
                width: 300,
                height: 90,
                margin: const EdgeInsets.only(top: 10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context, _snoozeMinute);
                  },
                  child: const Text("Set", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: "Chakra"),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}