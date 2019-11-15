import 'package:flutter/material.dart';
// import 'package:qestudio_v2/common/box_card.dart';
import 'package:qestudio_v2/common/timetable_things.dart';

class Timetable extends StatefulWidget {
  Timetable({
    Key key,
    @required this.week,
  }) : super(key: key);
  final Week week;

  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          HomeworkView(
            day: widget.week.today(),
          ),
        ],
      ),
    );
  }
}
