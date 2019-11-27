//import 'dart:developer' as developer;
//import 'package:http/http.dart' as http;
//import 'dart:convert';
//import 'package:wel_planner/model/event.dart';
//
//
//const String planAPIURL = 'http://championships.ringo.org.pl/event.json';
//
//Future<List<Event>> fetchEvent() async {
//  String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedValue);
//
//  //default group
//  //will be change
//  String group = 'e6c1s1';
//  //tbdeleted
//  developer.log(formattedDate);
//  var url =
//      'http://championships.ringo.org.pl/event/$group/$formattedDate.json';
//  //tbdeleted
//  developer.log(
//      'http://championships.ringo.org.pl/event/$group/$formattedDate.json');
//
//  var response = await http.get(url);
//  //tbdeleted
//  developer.log('status code:' + response.statusCode.toString());
//
//  var events = List<Event>();
//  if (response.statusCode == 200) {
//    var eventJson = json.decode(response.body);
//    for (var noteJson in eventJson) {
//      events.add(Event.fromJson(noteJson));
//    }
//  }
//  return events;
//}
