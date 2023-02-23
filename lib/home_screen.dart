import 'package:flutter/material.dart';
import 'package:project1/set_alarm_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[400],
        title: const Text("Alarm", style: TextStyle(fontSize: 40)),
      ),
      body: const Center(
        child: Text("Hola"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SetAlarmScreen()),
          );
          setState(() {
            // force recall build()
            // _incrementCounter();
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}