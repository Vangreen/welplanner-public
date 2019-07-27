import 'package:flutter/material.dart';
import './pages/home_page.dart';
import 'package:equinox/equinox.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EquinoxApp(
      theme: EqThemes.defaultLightTheme,
      title: 'WelPlanner',
      home: HomePage(),
    );
  }
}