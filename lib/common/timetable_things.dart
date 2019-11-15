import 'package:flutter/material.dart';
import 'package:qestudio_v2/common/class_dialog.dart';

class Week {
  static List<Day> days = [
    Day(classes: <Class>[
      Class(name: "Physics", teacher: "Mrs Glaves", tasks: <Task>[
        Task(
            title: "Complete match up on particles",
            description: "Hand in to physics office",
            dueIn: DateTime.utc(2019, 10, 25))
      ]),
      Class(name: "Music", teacher: "Mr Leather", tasks: <Task>[
        Task(
            title: "Listen to Mozart's Ninth Symphony and do sheet",
            description: "Apple Music probably has it",
            dueIn: DateTime.utc(2019, 10, 24))
      ]),
      Class(name: "Maths", teacher: "Mr McElroy", tasks: <Task>[
        Task(
            title: "Complete MyMaths tasks",
            description: "...oh no.",
            dueIn: DateTime.utc(2019, 10, 26)),
        Task(
            title: "Do crossword on pythagoras",
            description: "McCool",
            dueIn: DateTime.utc(2019, 10, 23))
      ]),
      Class(name: "Textiles", teacher: "Mrs Kershaw", tasks: <Task>[]),
      Class(name: "Computing", teacher: "Mrs Chambers", tasks: <Task>[])
    ]),
  ];
  Day today() => days[0];
  List<Exam> exams() => [
        Exam(
            subject: "Physics", dateTime: DateTime.now().add(Duration(days: 1)))
      ];
}

class Exam {
  Exam({
    @required this.subject,
    @required this.dateTime,
    this.notes,
  });

  String subject;
  DateTime dateTime;
  String notes;
}

class Day {
  List<Class> classes;

  Day({@required this.classes});

  List<Task> tasks() {
    List<Task> tasks = new List<Task>();

    for (Class thisClass in classes) {
      tasks.addAll(thisClass.tasks);
    }
    return tasks;
  }

  int numClasses() {
    int numberOfClasses = 0;
    for (Class thisClass in classes) {
      numberOfClasses += thisClass.tasks.length;
    }
    return numberOfClasses;
  }
}

class Class {
  String name;
  String teacher;
  List<Task> tasks;

  Class({@required this.name, @required this.teacher, this.tasks});
}

class Task {
  String title;
  String description;
  DateTime dueIn;
  bool done;
  // String subject;

  Task(
      {@required this.title,
      // @required this.subject,
      this.description,
      this.dueIn,
      this.done = false});
}

class QuickLookTimetableItem extends StatelessWidget {
  const QuickLookTimetableItem({
    Key key,
    @required this.subject,
    @required this.numTasks,
  }) : super(key: key);
  final String subject;
  final int numTasks;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: (numTasks == 0 ? Colors.green[100] : Colors.red[100]),
      child: ListTile(
        onTap: () => {},
        title: Text(
          subject,
          style: Theme.of(context).textTheme.body2.copyWith(fontSize: 22)),
        trailing: Text(
            (numTasks == 0 ? "No" : numTasks.toString()) +
                " task" +
                (numTasks != 1 ? "s" : "") +
                " for today",
            style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18)),
      ),
    );
  }
}

class HomeworkView extends StatefulWidget {
  HomeworkView({Key key, @required this.day}) : super(key: key);
  final Day day;

  _HomeworkViewState createState() => _HomeworkViewState();
}

class _HomeworkViewState extends State<HomeworkView> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(widget.day.tasks().length, (thisTask) {
      return HomeworkCard(
        checkboxValue: widget.day.tasks()[thisTask].done,
        onCheckboxChanged: (newValue) => setState(() {
          widget.day.tasks()[thisTask].done = newValue;
        }),
        title: Text(widget.day.tasks()[thisTask].title),
        subtitle: [
          Text(widget.day.tasks()[thisTask].dueIn.day.toString() +
              "/" +
              widget.day.tasks()[thisTask].dueIn.month.toString()),
          Text(widget.day.tasks()[thisTask].description),
        ],
      );
    }));
  }
}

class HomeworkCard extends StatefulWidget {
  HomeworkCard({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.checkboxValue,
    @required this.onCheckboxChanged,
  }) : super(key: key);

  final Widget title;
  final List<Widget> subtitle;
  final bool checkboxValue;
  final void Function(bool) onCheckboxChanged;

  _HomeworkCardState createState() => _HomeworkCardState();
}

class _HomeworkCardState extends State<HomeworkCard> {
  int itemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            onTap: () {
              if (itemIndex < widget.subtitle.length - 1) {
                itemIndex++;
              } else {
                itemIndex = 0;
              }
              setState(() {});
            },
            trailing: Checkbox(
              value: widget.checkboxValue,
              onChanged: (newValue) { 
                widget.onCheckboxChanged(newValue);
                setState(() {});
              },
              activeColor: Theme.of(context).accentColor,
            ),
            title: widget.title,
            subtitle: widget.subtitle[itemIndex]));
  }
}
