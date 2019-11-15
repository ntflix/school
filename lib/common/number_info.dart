
// import 'dart:ffi';
import 'package:flutter/material.dart';

class NumberInfo extends StatelessWidget {
  const NumberInfo({
    Key key,
    @required this.title,
    @required this.number,
    @required this.tooltipMessage,
    @required this.color,
    this.onTap,
  }) : super(key: key);

  final String title;
  final int number;
  final Color color;
  final String tooltipMessage;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipMessage,
      child: 
      InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Text(title, style: Theme.of(context).textTheme.body2.copyWith(fontSize: 16)),
            Text(number.toString(), style: Theme.of(context).textTheme.display3.copyWith(color: color)),
          ],
        ),
      ),
    );
  }
}