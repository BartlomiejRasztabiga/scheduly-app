// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to Flutter', home: TodaysSchedule());
  }
}

class TodaysSchedule extends StatefulWidget {
  @override
  _TodaysScheduleState createState() => _TodaysScheduleState();
}

class _TodaysScheduleState extends State<TodaysSchedule> {
  final _entries = <ScheduleEntry>[
    new ScheduleEntry("9:00", "10:00", "test"),
    new ScheduleEntry("10:00", "11:00", "test"),
    new ScheduleEntry("10:00", "11:00", "test")
  ];
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduly'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.separated(
        padding: EdgeInsets.all(16.0),
        itemCount: _entries.length,
        itemBuilder: (context, i) {
          return _buildRow(_entries[i]);
        },
        separatorBuilder: (context, i) {
          return Divider();
        });
  }

  Widget _buildRow(ScheduleEntry pair) {
    return ListTile(
      title: Text(
        pair.toText(),
        style: _biggerFont,
      ),
    );
  }
}

class ScheduleEntry {
  String startingHour;
  String endingHour;
  String title;

  ScheduleEntry(String startingHour, String endingHour, String title) {
    this.startingHour = startingHour;
    this.endingHour = endingHour;
    this.title = title;
  }

  String toText() {
    return '${this.startingHour}-${this.endingHour}  ${this.title}';
  }
}
