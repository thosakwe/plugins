import 'package:flutter/cupertino.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: ListView(
          children: <Widget>[],
        ),
      ),
    );
  }
}
