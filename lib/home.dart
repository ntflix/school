import 'package:flutter/material.dart';
import 'package:qestudio_v2/mini_screens/overview.dart';
import 'package:qestudio_v2/mini_screens/timetable.dart';
import 'package:qestudio_v2/mini_screens/find.dart';
import 'package:qestudio_v2/mini_screens/settings.dart';
import 'package:qestudio_v2/common/timetable_things.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Overview')),
    BottomNavigationBarItem(
        icon: Icon(Icons.format_align_left), title: Text('Homework')),
    BottomNavigationBarItem(icon: Icon(Icons.scanner), title: Text('Scan')),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings), title: Text('Settings')),
  ];
  List<Widget> dynamicRoutes = [
    Overview(week: Week()),
    Timetable(week: Week()),
    Find(),
    Settings(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        // title: Text("QEStudio", style: Theme.of(context).textTheme.display1),
        title: Container(child: FittedBox(child: Image(image: ExactAssetImage("assets/logos/qestudio.png")), fit: BoxFit.scaleDown), height: 50),
      ),
      body: Container(
          color: Color(0x0f000000), child: dynamicRoutes[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: navItems,
        onTap: (item) {
          _selectedIndex = item;
          // print(dynamicRoutes[_selectedIndex]);
          setState(() {});
        },
      ),
    );
  }
}
