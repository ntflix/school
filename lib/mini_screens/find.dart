import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pdf;

class Find extends StatefulWidget {
  Find({Key key}) : super(key: key);

  // final MethodChannel platform = MethodChannel('iron59.scandocs');

  // Future<pdf.Document> scanDoc() async {
  //   pdf.Document doc;
  //   bool hasWorked = true;

  //   try {
  //     if (Platform.isIOS)
  //       doc = await platform.invokeMethod('scanDocsChannel');
  //   } on PlatformException catch (_) {
  //     hasWorked = false;
  //   }
  //   if (hasWorked)
  //     return doc;
  //   else
  //     return null;
  // }
  _FindState createState() => _FindState();
}

class _FindState extends State<Find> {
  @override
  Widget build(BuildContext context) {
    // pdf.Document doc;
    // Future<pdf.Document> futureDoc = widget.scanDoc();
    // futureDoc.then((document) => doc = document);

    return Container(
      //  child: doc ?? Text("Loading"),
      child: UiKitView(viewType: "ScanDocsView", onPlatformViewCreated: (_) => print("Success!"))
    );
  }
}