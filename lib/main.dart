import 'package:flutter/material.dart';
import 'package:qestudio_v2/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QEStudio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlue,
        textTheme: TextTheme(
          // display1: Theme.of(context).textTheme.display1.copyWith(fontFamily: [customFont]),
        )
      ),
      home: Home(),
    );
  }
}