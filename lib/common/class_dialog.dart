import 'package:flutter/material.dart';

class ClassDialog extends StatefulWidget {
  const ClassDialog({
    Key key,
    @required this.title,
    @required this.child,
    @required this.buttonText,
    @required this.numClasses,
  }) : super(key: key);

  final avatarRadius = 30.0;
  final paddingRadius = 10.0;
  final String title, buttonText;
  final Widget child;
  final int numClasses;

  final List<IconData> filterIcons = const [
    Icons.filter_none,
    Icons.filter_1,
    Icons.filter_2,
    Icons.filter_3,
    Icons.filter_4,
    Icons.filter_5,
    Icons.filter_6,
    Icons.filter_7,
    Icons.filter_8,
    Icons.filter_9,
    Icons.filter_9_plus,
  ];

  _ClassDialogState createState() => _ClassDialogState();
}

class _ClassDialogState extends State<ClassDialog> {
  @override
  Widget build(BuildContext context) {

    return Dialog(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(30),
      // ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: widget.avatarRadius + widget.paddingRadius,
              bottom: widget.paddingRadius,
              left: widget.paddingRadius,
              right: widget.paddingRadius,
            ),
            margin: EdgeInsets.only(top: widget.avatarRadius),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(widget.paddingRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                widget.child,
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // To close the dialog
                    },
                    child: Text(widget.buttonText),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: widget.paddingRadius,
            right: widget.paddingRadius,
            child: CircleAvatar(
              child: Icon(widget.filterIcons[widget.numClasses], color: Colors.white),
              backgroundColor: Theme.of(context).accentColor,
              radius: widget.avatarRadius,
            ),
          ),
        ],
      ),
    );
  }
}
