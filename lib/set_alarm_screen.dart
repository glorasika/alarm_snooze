import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:project1/alarm_sound_screen.dart';
import 'package:project1/set_snooze_screen.dart';

class SetAlarmScreen extends StatefulWidget {
  const SetAlarmScreen({Key? key}) : super(key: key);

  @override
  State<SetAlarmScreen> createState() => _SetAlarmScreen();
}

class _SetAlarmScreen extends State<SetAlarmScreen> {
  int _currentHour = DateTime.now().hour;
  int _currentMinute = DateTime.now().minute;
  String _snoozeTime = '0';
  String _alarmSound = 'alarm1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[300],
          title: const Text("Set Alarm",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Chakra",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1)),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.fromLTRB(47, 25, 47, 25),
                  width: 300,
                  decoration: BoxDecoration(
                    // color: Colors.,
                    border: Border.all(color: Colors.deepPurple, width: 3),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: NumberPicker(
                          value: _currentHour,
                          minValue: 0,
                          maxValue: 23,
                          step: 1,
                          infiniteLoop: true,
                          textStyle: const TextStyle(
                              fontSize: 28,
                              fontFamily: "Chakra",
                              fontWeight: FontWeight.w700),
                          selectedTextStyle: const TextStyle(
                              fontSize: 40,
                              fontFamily: "Chakra",
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                          onChanged: (value) =>
                              setState(() => _currentHour = value),
                        ),
                      ),
                      Container(
                        child: NumberPicker(
                          value: _currentMinute,
                          minValue: 0,
                          maxValue: 59,
                          step: 1,
                          infiniteLoop: true,
                          textStyle: const TextStyle(
                              fontSize: 28,
                              fontFamily: "Chakra",
                              fontWeight: FontWeight.w700),
                          selectedTextStyle: const TextStyle(
                              fontSize: 40,
                              fontFamily: "Chakra",
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                          onChanged: (value) =>
                              setState(() => _currentMinute = value),
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
                        margin: const EdgeInsets.fromLTRB(40, 0, 60, 0),
                        child: const Text(
                          "Snooze",
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: "Chakra",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 120,
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
                                  builder: (context) =>
                                      const SetSnoozeScreen()),
                            ).then((value) {
                              if (value != null) {
                                setState(() {
                                  _snoozeTime = value.toString();
                                });
                              }
                            });
                          },
                          child: Text(_snoozeTime,
                              style: const TextStyle(
                                  fontSize: 30, fontFamily: "Chakra"),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 0, 80, 0),
                        child: const Text(
                          "Sound",
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: "Chakra",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            print("will load alarm sound screen");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AlarmSoundScreen()),
                            ).then((value) {
                              setState(() {
                                _alarmSound = value;
                              });
                            });
                          },
                          child: Text(
                            _alarmSound,
                            style: const TextStyle(
                                fontSize: 25,
                                fontFamily: "Chakra",
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ],
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
                      Navigator.pop(context, [
                        _currentHour,
                        _currentMinute,
                        _snoozeTime,
                        _alarmSound
                      ]);
                    },
                    child: const Text(
                      "Create",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Chakra"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
