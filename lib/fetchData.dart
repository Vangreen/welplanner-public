//import 'package:http/http.dart' as http;
//import 'dart:convert';
//import 'package:flutter_fun/podoRepos.dart';
//
//
//bool checked = false;
//
//List<Repos> list = List();
//var isLoading = false;
//
//_fetchData() async {
//  setState(() {
//    isLoading = true;
//  });
//  final response =
//  await http.get("https://api.github.com/orgs/TeamHorizon/repos");
//  if (response.statusCode == 200) {
//    list = (json.decode(response.body) as List)
//        .map((data) => new Repos.fromJson(data))
//        .toList();
//    setState(() {
//      isLoading = false;
//    });
//  } else {
//    throw Exception('Failed to load photos');
//  }
//}