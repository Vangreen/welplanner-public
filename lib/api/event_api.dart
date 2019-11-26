//
//import 'package:http/http.dart' as http;
//import 'dart:convert';
//import 'package:wel_planner/model/event.dart';
//
//
//const String planAPIURL = 'http://championships.ringo.org.pl/event.json';
//
//class EventAPI {
//  //List<Event> _events = List<Event>();
//
//  Future<List<Event>> fetchEvent() async {
//    var url = 'http://championships.ringo.org.pl/event.json';
//    var response = await http.get(url);
//
//    var events = List<Event>();
//
//    if (response.statusCode == 200) {
//      var eventJson = json.decode(response.body);
//      for (var noteJson in eventJson) {
//        events.add(Event.fromJson(noteJson));
//      }
//    }
//    return events;
//  }
//
//}
