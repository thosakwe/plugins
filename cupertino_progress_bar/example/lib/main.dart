import 'package:flutter/cupertino.dart';
import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';

void main() => runApp(DemoApp());

const String imageUrl = 'https://upload.wikimedia.org/wikipedia/en/thumb/f/fa/'
    'P-Square_-_Double_Trouble_cover.jpg/220px-P-Square_-_Double_Trouble_'
    'cover.jpg';

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  double value = 0.3;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        // navigationBar: CupertinoNavigationBar(
        //   middle: Text('Downloads'),
        // ),
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Downloads'),
              trailing: CupertinoButton(
                child: Text('Edit'),
                onPressed: () => null,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        imageUrl,
                        width: 40,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('Shekini'),
                                  Text(
                                    ' - P Square',
                                    style: TextStyle(
                                      color: Color(0xffb5b5b5),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              CupertinoProgressBar(
                                value: value,
                              ),
                              SizedBox(height: 4),
                              Text(
                                '758MB of 1.0GB',
                                style: TextStyle(
                                  color: Color(0xffb5b5b5),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CupertinoButton(
                        child: Icon(CupertinoIcons.pause_solid),
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Color(0xffecebed),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: CupertinoSlider(
                    value: value,
                    onChanged: (v) {
                      setState(() => value = v);
                    },
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
