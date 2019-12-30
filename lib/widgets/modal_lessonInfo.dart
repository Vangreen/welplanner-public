import 'package:flutter/material.dart';

class ModalLessonInfo {
  mainBottomSheet(BuildContext context, String lessonName, String location, String teacher) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _createTile(context, lessonName, Icons.info, null),
              _createTile(context, location, Icons.location_city, null),
              _createTile(context, teacher, Icons.people, null),
            ],
          );
        });
  }

  ListTile _createTile(
      BuildContext context, String name, IconData icon, Function action) {
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: () {
        Navigator.pop(context);
        action();
      },
    );
  }
}
