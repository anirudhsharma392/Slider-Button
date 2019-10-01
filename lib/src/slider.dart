import 'package:flutter/material.dart';

import 'shimmer.dart';

class SliderButton extends StatefulWidget {
  final double radius;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color baseColor;
  final Color highlightedColor;
  final Color buttonColor;
  final Text label;
  final Alignment alignLabel;
  final BoxShadow boxShadow;
  final Widget icon;
  final Function action;

  SliderButton({
    @required this.action,
    this.radius = 100,
    this.boxShadow = const BoxShadow(
      color: Colors.black,
      blurRadius: 4,
    ),
    this.height = 60,
    this.width = 260,
    this.alignLabel = const Alignment(0.4, 0),
    this.backgroundColor = const Color(0xffececec),
    this.baseColor = const Color(0xff4a4a4a),
    this.buttonColor = Colors.black,
    this.highlightedColor = Colors.white,
    this.label = const Text(
      "Slide to cancel Event",
      style: TextStyle(
          color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 17),
    ),
    this.icon = const Text(
      "x",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 44,
      ),
    ),
  });

  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  bool flag;

  @override
  void initState() {
    super.initState();
    flag = true;
  }

  @override
  Widget build(BuildContext context) {
    return flag == true
        ? Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(widget.radius)),
            alignment: Alignment.centerLeft,
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: widget.alignLabel,
                  child: Shimmer.fromColors(
                    baseColor: widget.baseColor,
                    highlightColor: widget.highlightedColor,
                    child: widget.label,
                  ),
                ),
                Dismissible(
                    key: Key("cancel"),
                    direction: DismissDirection.startToEnd,

                    ///gives direction of swipping in argument.
                    onDismissed: (dir) {
                      setState(() {
                        flag = false;
                      });
                      widget.action();
                    },
                    child: Container(
                      width: widget.width - 60,
                      height: widget.height,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: widget.height,
                        width: widget.height,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                            boxShadow: [
                              widget.boxShadow,
                            ],
                            color: widget.buttonColor,
                            borderRadius: BorderRadius.circular(widget.radius)),
                        child: widget.icon,
                      ),
                    )),
              ],
            ))
        : Container();
  }
}
