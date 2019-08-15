import 'package:flutter/cupertino.dart';

class CupertinoProgressBar extends StatefulWidget {
  final double value;
  final Duration animationDuration;
  final double height;
  final Color color;
  final Color trackColor;

  const CupertinoProgressBar(
      {Key key,
      @required this.value,
      this.animationDuration = const Duration(milliseconds: 500),
      this.height = 2,
      this.color,
      this.trackColor = const Color(0xFFb5b5b5)})
      : super(key: key);

  @override
  CupertinoProgressBarState createState() => CupertinoProgressBarState();
}

class CupertinoProgressBarState extends State<CupertinoProgressBar>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    animateToValue();
  }

  void animateToValue() {
    var v = widget.value.clamp(0.0, 1.0);
    // animation = Tween<double>(begin: 0, end: v).animate(animationController)
    animation = Tween<double>(begin: 0, end: v).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.125,
          0.250,
          curve: Curves.ease,
        )))
      ..addListener(() {
        setState(() {
          // TODO:
        });
      });
    animationController.forward();
  }

  @override
  void deactivate() {
    super.deactivate();
    animationController?.dispose();
  }

  @override
  void didUpdateWidget(CupertinoProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    animationController.duration = widget.animationDuration;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Stack(
            children: <Widget>[
              Container(
                height: widget.height,
                width: constraints.maxWidth,
                color: widget.trackColor,
              ),
              Container(
                height: widget.height,
                width: constraints.maxWidth *
                    widget.value *
                    animationController.value,
                color: widget.color ?? CupertinoTheme.of(context).primaryColor,
              )
            ],
          ),
        );
      },
    );
  }
}
