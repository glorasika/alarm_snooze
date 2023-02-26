import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(AlarmSoundScreen());

class AlarmSoundScreen extends StatelessWidget {
  AlarmSoundScreen({Key? key}) : super(key: key);

  String _alarmSound = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[300],
        title: const Text("Alarm Sound",
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
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.fromLTRB(25, 50, 30, 0),
                        height: 80,
                        width: 150,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            AudioPlayer().play(AssetSource('sound/alarm1.mp3'));
                          },
                          child: const Text(
                            "alarm 1",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Chakra',
                                letterSpacing: 1),
                          ),
                        )
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      height: 80,
                      width: 160,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          _alarmSound = 'alarm1';
                          Navigator.pop(context, _alarmSound);
                        },
                        child: const Text("choose", style: TextStyle(fontSize: 35, fontFamily: "Chakra"),),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.fromLTRB(25, 30, 30, 0),
                        height: 80,
                        width: 150,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            AudioPlayer().play(AssetSource('sound/alarm2.mp3'));
                          },
                          child: const Text(
                            "alarm 2",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Chakra',
                                letterSpacing: 1),
                          ),
                        )
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 80,
                      width: 160,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          _alarmSound = 'alarm2';
                          Navigator.pop(context, _alarmSound);
                        },
                        child: const Text("choose", style: TextStyle(fontSize: 35, fontFamily: "Chakra"),),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.fromLTRB(25, 30, 30, 0),
                        height: 80,
                        width: 150,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            AudioPlayer().play(AssetSource('sound/alarm3.mp3'));
                          },
                          child: const Text(
                            "alarm 3",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Chakra',
                                letterSpacing: 1),
                          ),
                        )
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 80,
                      width: 160,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          _alarmSound = 'alarm3';
                          Navigator.pop(context, _alarmSound);
                        },
                        child: const Text("choose", style: TextStyle(fontSize: 35, fontFamily: "Chakra"),),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.fromLTRB(25, 30, 30, 0),
                        height: 80,
                        width: 150,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            AudioPlayer().play(AssetSource('sound/alarm4.mp3'));
                          },
                          child: const Text(
                            "alarm 4",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Chakra',
                                letterSpacing: 1),
                          ),
                        )
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 80,
                      width: 160,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          _alarmSound = 'alarm4';
                          Navigator.pop(context, _alarmSound);
                        },
                        child: const Text("choose", style: TextStyle(fontSize: 35, fontFamily: "Chakra"),),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.fromLTRB(25, 30, 30, 0),
                        height: 80,
                        width: 150,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            AudioPlayer().play(AssetSource('sound/alarm5.mp3'));
                          },
                          child: const Text(
                            "alarm 5",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Chakra',
                                letterSpacing: 1),
                          ),
                        )
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 80,
                      width: 160,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          _alarmSound = 'alarm5';
                          Navigator.pop(context, _alarmSound);
                        },
                        child: const Text("choose", style: TextStyle(fontSize: 35, fontFamily: "Chakra"),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
