import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:project1/set_alarm_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentHour = DateTime.now().hour;
  int _currentMinute = DateTime.now().minute;
  int _snoozeTime = 0;
  String _alarmSound = 'alarm1';

  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<String> _alarms = [];
  bool isSwitched = false;

  void _savedAlarms() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setStringList('alarms', _alarms);
  }

  void _addAlarm(hour, minute, snooze, sound) async {
    final SharedPreferences prefs = await _prefs;
    List<String>? newAlarm = prefs.getStringList('alarms');
    newAlarm?.add(
        '{"hour": $_currentHour, "minute": $_currentMinute, "snooze": $_snoozeTime, "sound": "$_alarmSound", "switch": "false"}');
    prefs.setStringList('alarms', newAlarm!);
    _alarms = newAlarm;
    // print(json.decode(newAlarm[0]));
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
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: _alarms.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      margin: const EdgeInsets.only(top: 20, bottom: 15),
                      color: Colors.deepPurple,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  child: Text(
                                    "${json.decode(_alarms[index])['hour'] / 10 < 1 ?
                                    "0${json.decode(_alarms[index])['hour']}" : json.decode(_alarms[index])['hour']}"
                                        ":${json.decode(_alarms[index])['minute'] / 10 < 1 ?
                                    "0${json.decode(_alarms[index])['minute']}" : json.decode(_alarms[index])['minute']}",
                                    style:
                                    const TextStyle(color: Colors.white, fontSize: 50, fontFamily: 'Anton', letterSpacing: 6),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                                  child: Text("snooze: ${json.decode(_alarms[index])['snooze']}", style: const TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'Anton', letterSpacing: 2),),
                                ),
                                Container(
                                  width: 90,
                                  margin: const EdgeInsets.fromLTRB(25, 22, 0, 0),
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Switch(
                                      value: isSwitched,
                                      // value: (json.decode(_alarms[index])['switch'].toString().toLowerCase() == 'true' ? true : false),
                                      onChanged: (value) {
                                        setState(() {
                                          isSwitched = value;
                                        // json.decode(_alarms[index])['switch'] = newValue=='true' ? true:false;
                                          // if (isSwitched == true) {
                                          //   if (json.decode(_alarms[index])['hour'] == DateTime.now().hour && json.decode(_alarms[index])['minute'] == DateTime.now().minute) {
                                          //     AudioPlayer().play(AssetSource('sound/${json.decode(_alarms[index])['sound']}.mp3'));
                                          //   }
                                          // }
                                        });
                                      },
                                      activeTrackColor: Colors.lightGreenAccent,
                                      activeColor: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SetAlarmScreen()),
          ).then((value) {
            setState(() {
              _currentHour = value[0];
              _currentMinute = value[1];
              _snoozeTime = int.parse(value[2]);
              _addAlarm(_currentHour, _currentMinute, _snoozeTime, _alarmSound);
            });
          });
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
