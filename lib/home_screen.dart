import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project1/set_alarm_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentHour = 0;
  int _currentMinute = 0;
  int _snoozeTime = 0;
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final List<String> _alarms = ['{"hour": "11", "minute": "12", "snooze": "0"}', '{"hour": "12", "minute": "13", "snooze": "0"}'];

  void _savedAlarms() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setStringList('alarms', _alarms);
    print(int.parse(json.decode(prefs.getStringList('alarms')?[0] as String)['minute']));
  }

  @override
  void initState() {
    _savedAlarms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[300],
        title: const Text("Alarm", style: TextStyle(fontSize: 40)),
      ),
      body: SafeArea (
        child: Center (
          child: Column (
            children: <Widget>[
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SetAlarmScreen()),
          ).then((value) {
            setState(() {
              _currentHour = value[0];
              _currentMinute = value[1];
              _snoozeTime = int.parse(value[2]);
              print(_currentHour);
              print(_currentMinute);
              print(_snoozeTime);
              print(DateTime.now().hour);
              print(DateTime.now().minute);
            });
          });
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}