import 'dart:convert';
import 'dart:developer' as developer;

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:wel_planner/model/event.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedValue = DateTime.now();

  //To sluzy do dopasowania elementow do wyswietlacza telefonu
  //dzieki temu wyswietlane elementy beda rowne na kazdym telefonie
  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  List<Event> _events = List<Event>();

  Future<List<Event>> fetchEvent() async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedValue);
    //tbdeleted
    developer.log(formattedDate);
    var url =
        'http://championships.ringo.org.pl/event/e6c1s1/$formattedDate.json';
    //tbdeleted
    developer.log(
        'http://championships.ringo.org.pl/event/e6c1s1/$formattedDate.json');

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
      drawer: SizedBox(
        width: screenSize(context).width / 2.2,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("E6C1S1"),
              ),
              ListTile(
                title: Text("E6T1S1"),
              ),
            ],
          ),
        ),
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
      ),
      bottomNavigationBar: BottomAppBar(
        child: DatePickerTimeline(
          _selectedValue,
          onDateChange: (date) {
            // New date selected
            setState(() {
              _selectedValue = date;
              fetchEvent().then((value) {
                setState(() {
                  _events.clear();
                  _events.addAll(value);
                });
              });
            });
            //   initState();
          },
        ),
      ),
    );
  }
}
