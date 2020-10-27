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
    new ScheduleEntry(1, "9:00", "10:00", "test"),
    new ScheduleEntry(2, "10:00", "11:00", "test"),
    new ScheduleEntry(3, "11:00", "12:00", "test1")
  ];
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduly'),
      ),
      body: _buildSchedule(),
    );
  }

  Widget _buildSchedule() {
    return ReorderableListView(
        children: _entries.map((item) => _buildRow(item)).toList(),
        onReorder: (int oldIndex, int newIndex) {
          setState(
            () {
              print("$oldIndex, $newIndex");
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final ScheduleEntry item = _entries.removeAt(oldIndex);
              _entries.insert(newIndex, item);
            },
          );
        });
  }

  Widget _buildRow(ScheduleEntry entry) {
    return ListTile(
        key: Key(entry.index.toString()),
        title: Text(
          entry.getHourHeader(),
          style: _biggerFont,
        ),
        subtitle: Text(entry.getTaskTitle()),
        trailing: Icon(Icons.menu));
  }
}

class ScheduleEntry {
  int index;
  String startingHour;
  String endingHour;
  String title;

  ScheduleEntry(
      int index, String startingHour, String endingHour, String title) {
    this.index = index;
    this.startingHour = startingHour;
    this.endingHour = endingHour;
    this.title = title;
  }

  String getHourHeader() {
    return '${this.startingHour} - ${this.endingHour}';
  }

  String getTaskTitle() {
    return this.title;
  }
}
