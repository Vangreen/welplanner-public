import 'dart:convert';
import 'dart:developer' as developer;

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:wel_planner/backend/indexToTimeConverter.dart';
import 'package:wel_planner/model/event.dart';
import 'package:wel_planner/model/group.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedValue = DateTime.now();

  //default group
  //will be change
  String group = 'E6C1S1';

  //To sluzy do dopasowania elementow do wyswietlacza telefonu
  //dzieki temu wyswietlane elementy beda rowne na kazdym telefonie
  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  List<Event> _events = List<Event>();
  List<Group> _groups = List<Group>();

  Future<List<Event>> fetchEvent() async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedValue);

    //tbdeleted
    developer.log(formattedDate);
    var url =
        'http://championships.ringo.org.pl/event/$group/$formattedDate.json';
    //tbdeleted
    developer.log(
        'http://championships.ringo.org.pl/event/$group/$formattedDate.json');

    var response = await http.get(url);
    //tbdeleted
    developer.log('Event status code: ' + response.statusCode.toString());

    var events = List<Event>();
    if (response.statusCode == 200) {
      var eventJson = json.decode(utf8.decode(response.bodyBytes));
      for (var noteJson in eventJson) {
        events.add(Event.fromJson(noteJson));
      }
    }
    return events;
  }

  Future<List<Group>> fetchGroup() async {
    var url = 'http://championships.ringo.org.pl/event/group_list.json';

    var response = await http.get(url);

    //tbdeleted
    developer.log('Event status code: ' + response.statusCode.toString());

    var groups = List<Group>();
    if (response.statusCode == 200) {
      var groupJson = json.decode(utf8.decode(response.bodyBytes));
      for (var noteJson in groupJson) {
        groups.add(Group.fromJson(noteJson));
      }
    }
    return groups;
  }


  //This convert String hex (like on plany.wel) to Dart Color
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

//  void fetchGroup() async {
//    var groupJson = await GroupAPI().getGroups();
//    print(groupJson);
//
//    var groupMap = jsonDecode(groupJson);
//    setState(() {
//      _groups.addAll(groupMap);
//      developer.log(_groups.toString());
//      developer.log(_groups.length.toString());
//
//    });
//  }

  @override
  void initState() {
    fetchEvent().then((value) {
      setState(() {
        _events.addAll(value);
      });
    });
    fetchGroup().then((value) {
      setState(() {
        _groups.addAll(value);
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
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                        title: Text(_groups[index].name),
                        onTap: () {
                          setState(() {
                            group = _groups[index].name.toString();
                            fetchEvent().then((value) {
                              setState(() {
                                _events.clear();
                                _events.addAll(value);
                              });
                            });
                          });
                        }),
                  ],
                ),
              );
            },
            itemCount: _groups.length,
          ),
//          child: ListView(
//            children: <Widget>[
//              ListTile(
//                title: Text("E6C1S1"),
//              ),
//              ListTile(
//                title: Text("E6T1S1"),
//              ),
//            ],
//
//          ),
        ),
      ),
      body: SwipeDetector(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  width: screenSize(context).width * 0.11,
                  height: 100,
                  child: Text(
                    indexToTimeConverter(_events[index].id),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: screenSize(context).width,
                  height: 100,
                  margin: new EdgeInsets.only(
                    left: screenSize(context).width * 0.11,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ClipPath(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                      color: hexToColor(_events[index].color), width: screenSize(context).width * 0.20))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 32.0,  left: 16.0, right: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _events[index].lessonName,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                _events[index].location,
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      clipper: ShapeBorderClipper(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: _events.length,
        ),
        onSwipeLeft: () {
          developer.log('swype left');
          setState(() {
            _selectedValue = _selectedValue.add(new Duration(days: 1));
            fetchEvent().then((value) {
              setState(() {
                _events.clear();
                _events.addAll(value);
              });
            });
          });
        },
        onSwipeRight: () {
          developer.log('swype left');
          setState(() {
            _selectedValue = _selectedValue.subtract(new Duration(days: 1));
            fetchEvent().then((value) {
              setState(() {
                _events.clear();
                _events.addAll(value);
              });
            });
          });
        },
        swipeConfiguration: SwipeConfiguration(
            verticalSwipeMinVelocity: 100.0,
            verticalSwipeMinDisplacement: 50.0,
            verticalSwipeMaxWidthThreshold: 100.0,
            horizontalSwipeMaxHeightThreshold: 50.0,
            horizontalSwipeMinDisplacement: 50.0,
            horizontalSwipeMinVelocity: 200.0),
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
