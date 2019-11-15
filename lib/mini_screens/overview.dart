import 'package:flutter/material.dart';
import 'package:qestudio_v2/common/box_card.dart';
import 'package:qestudio_v2/common/class_dialog.dart';
import 'package:qestudio_v2/common/number_info.dart';
import 'package:qestudio_v2/common/timetable_things.dart';
import 'package:qestudio_v2/common/homework_dialog.dart';

class Overview extends StatefulWidget {
  Overview({
    Key key,
    @required this.week,
  }) : super(key: key);
  final Week week;

  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        // elevation: 0,
        onPressed: () => {},
        child: Icon(Icons.calendar_today, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
      body: ListView(
        children: <Widget>[
          BoxCard(
            // Numbers
            insidePadding:
                EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
            child: Column(
              children: <Widget>[
                Text("Today",
                    style: Theme.of(context).textTheme.display1),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    NumberInfo(
                      title: "Tasks",
                      number: widget.week.today().tasks().length,
                      color: Colors.orange,
                      tooltipMessage: "Homework",
                      onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => HomeworkDialog(
                          title: "Homework",
                          child: HomeworkView(day: widget.week.today()),
                          buttonText: "okay",
                          numHwks: widget.week.today().tasks().length,
                        ),
                      ),
                    ),
                    widget.week.exams().length != 0
                        ? NumberInfo(
                            title: "Exams",
                            number: widget.week.exams().length,
                            color: Colors.green,
                            tooltipMessage: "Exams this week",
                            onTap: () => print("Exams"),
                          )
                        : null,
                    NumberInfo(
                      title: "Classes",
                      number: widget.week.today().classes.length,
                      color: Colors.green,
                      tooltipMessage: "Number of lessons today",
                      onTap: () => 
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => ClassDialog(
                            buttonText: "okay",
                            title: "Classes",
                            child: Text("bruh"),
                            numClasses: 5,
                          ),
                      ),                    
                    ),
                  ],
                ),
              ],
            ),
          ), // /Numbers
          //  BoxCard( // Homework
          //   child:
          Container(
            padding: EdgeInsets.only(top: 5, left: 5, right: 5),
            child: TimetableView(day: widget.week.today()),
          ),
          //  ), // /Homework
        ],
      ),
    );
  }
}

class TimetableView extends StatelessWidget {
  const TimetableView({Key key, @required this.day}) : super(key: key);
  final Day day;

  @override
  Widget build(BuildContext context) {
    List<QuickLookTimetableItem> homeworks =
        List.generate(day.classes.length, (thisClass) {
      return QuickLookTimetableItem(
        numTasks: day.classes[thisClass].tasks.length,
        subject: day.classes[thisClass].name,
      );
    });
    return Column(
      children: homeworks,
    );
  }
}
