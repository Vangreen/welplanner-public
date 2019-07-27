import 'package:flutter/material.dart';
import 'package:equinox/equinox.dart';
import 'package:intl/intl.dart';

var now = new DateTime.now();
String actualDate = (new DateFormat("dd-MM-yyyy").format(now)).toString();

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return EqLayout(
        appBar: EqAppBar(
        centerTitle: true,
        title: 'WelPlanner',
        subtitle: actualDate,
        ),
            child: Column(
        children: <Widget>[

    ],
    ),
    );

  }
}