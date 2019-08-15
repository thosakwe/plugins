import 'package:flutter/cupertino.dart';
import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';

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
          children: <Widget>[
            CupertinoProgressBar(
              value: .3,
            ),
          ],
        ),
      ),
    );
  }
}
