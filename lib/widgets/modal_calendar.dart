import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wel_planner/screens/home_screen.dart';

class ModalCalendar {
  HomeScreen homeScreen = new HomeScreen();
  CalendarController _calendarController;

  void onDaySelected(DateTime day, List events) {
    print(day.toString());
  }

  mainBottomSheet(BuildContext context) {
    _calendarController = CalendarController();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return TableCalendar(
            calendarController: _calendarController,

            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              selectedColor: Colors.deepOrange[400],
              todayColor: Colors.deepOrange[200],
              markersColor: Colors.brown[700],
              outsideDaysVisible: false,
            ),
            headerStyle: HeaderStyle(
              formatButtonTextStyle:
                  TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
              formatButtonDecoration: BoxDecoration(
                color: Colors.deepOrange[400],
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            onDaySelected: onDaySelected,
          );
        });
  }
}
