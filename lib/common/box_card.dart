import 'package:flutter/material.dart';

class BoxCard extends StatelessWidget {
  const BoxCard({
    Key key,
    @required this.child,
    this.insidePadding,
  }) : super(key: key);
  final Widget child;
  final EdgeInsets insidePadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10).copyWith(top: 12),
      decoration: BoxDecoration(
        // color: Colors.white,
        // border: Border.all(color: Colors.blue)
      ),
      child: Container(
        child: child,
        padding: insidePadding ?? EdgeInsets.all(0),
      ),
    );
  }
}