import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:project1/set_snooze_screen.dart';

class SetAlarmScreen extends StatefulWidget {
  const SetAlarmScreen({Key? key}) : super(key: key);

  @override
  State<SetAlarmScreen> createState() => _SetAlarmScreen();
}

class _SetAlarmScreen extends State<SetAlarmScreen> {
  String _snoozeTime = 'Set';

  int _currentHour = DateTime.now().hour;
  int _currentMinute = DateTime.now().minute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[300],
        title: const Text("Set Alarm", style: TextStyle(fontSize: 40, fontFamily: "Chakra")),
      ),
      body: SafeArea (
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
                child: Row (
                  children: <Widget>[
                    Container(
                      child: NumberPicker(
                        value: _currentHour,
                        minValue: 0,
                        maxValue: 23,
                        step: 1,
                        infiniteLoop: true,
                        textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                        selectedTextStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
                        onChanged: (value) => setState(() => _currentHour = value),
                      ),
                    ),
                    Container(
                      child: NumberPicker(
                        value: _currentMinute,
                        minValue: 0,
                        maxValue: 59,
                        step: 1,
                        infiniteLoop: true,
                        textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                        selectedTextStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
                        onChanged: (value) => setState(() => _currentMinute = value),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 30),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(40, 0, 80, 0),
                      child: const Text("Snooze", style: TextStyle(fontSize: 40),),
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          print("will load set snooze interval screen");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SetSnoozeScreen()
                            ),
                          ).then((value) {
                            print(value);
                            if (value != null) {
                              setState(() {
                                _snoozeTime = value.toString();
                              });
                            }
                          });
                        },
                        child: Text(_snoozeTime, style: const TextStyle(fontSize: 30, fontFamily: "Chakra"), textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              ),
              Container(),
            ],
          ),
        ),
      )
    );
  }
}