import 'dart:convert';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wel_planner/model/event.dart';
import 'package:wel_planner/api/event_api.dart';


import 'lesson_info.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedValue = DateTime.now();



  List<Event> _events = List<Event>();

  Future<List<Event>> fetchEvent() async {
    var url = 'http://championships.ringo.org.pl/event.json';
    var response = await http.get(url);

    var events = List<Event>();

    if (response.statusCode == 200) {
      var eventJson = json.decode(response.body);
      for (var noteJson in eventJson) {
        events.add(Event.fromJson(noteJson));
      }
    }
    return events;
  }

  @override
  void initState() {
    fetchEvent().then((value) {
      setState(() {
        _events.addAll(value);
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _events[index].lessonName,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _events[index].location,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: _events.length,
//        body: Container(
//          padding: EdgeInsets.all(20.0),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              Text("You Selected:"),
//              Padding(
//                padding: EdgeInsets.all(10),
//              ),
//              Text(_selectedValue.toString()),
//              Padding(
//                padding: EdgeInsets.all(20),
//              ),
//              DatePickerTimeline(
//                _selectedValue,
//                onDateChange: (date) {
//                  // New date selected
//                  setState(() {
//                    _selectedValue = date;
//                  });
//                },
//              ),
//            ],
//          ),
//        ));
        ));
  }
}
