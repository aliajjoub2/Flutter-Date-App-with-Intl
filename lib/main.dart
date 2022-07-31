import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DateApp(),
    );
  }
}

class DateApp extends StatefulWidget {
  const DateApp({Key? key}) : super(key: key);

  @override
  State<DateApp> createState() => _DateAppState();
}

class _DateAppState extends State<DateApp> {
 // Time

  String weekday = "";
  String date = "";
  String timeNow = "";

  changeEverySec(){
    Timer.periodic(const Duration(seconds:1), (timer){
      setState(() {
        weekday = DateFormat("EEEE").format(DateTime.now());
        date = DateFormat("MM d, y").format(DateTime.now());
        timeNow = DateFormat('hh : mm : ss a').format(DateTime.now());
      });
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeEverySec();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date App with Package Intl'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 253, 101, 177),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Today is $weekday'),
            const SizedBox(
              height: 20,
            ),
            Text(date),
            const SizedBox(
              height: 20,
            ),
            Text(timeNow),
            
          ],
        ),
      ),
    );
  }
}
