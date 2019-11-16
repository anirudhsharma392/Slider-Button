import 'package:flutter/material.dart';

import 'shimmer.dart';

class SliderButton extends StatefulWidget {
  ///Sets the radius of corners of a button.
  final double radius;

  ///Use it to define a height and width of widget.
  final double height;
  final double width;

  ///Use it to define a color of widget.
  final Color backgroundColor;
  final Color baseColor;
  final Color highlightedColor;
  final Color buttonColor;

  ///Change it to gave a label on a widget of your choice.
  final Text label;

  ///Gives a alignment to a slidder icon.
  final Alignment alignLabel;
  final BoxShadow boxShadow;
  final Widget icon;
  final Function action;

  ///Make it false if you want to deactivate the shimmer effect.
  final bool shimmer;

  ///Make it false if you want maintain the widget in the tree.
  final bool dismissible;

  SliderButton({
    @required this.action,
    this.radius = 100,
    this.boxShadow = const BoxShadow(
      color: Colors.black,
      blurRadius: 4,
    ),
    this.shimmer = true,
    this.height = 60,
    this.width = 240,
    this.alignLabel = const Alignment(0.4, 0),
    this.backgroundColor = const Color(0xffececec),
    this.baseColor = const Color(0xff4a4a4a),
    this.buttonColor = Colors.black,
    this.highlightedColor = Colors.white,
    this.label = const Text(
      "Slide to cancel !",
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
    this.dismissible = true,
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
        ? _control()
        : widget.dismissible == true
            ? Container()
            : Container(
                child: _control(),
              );
  }

  Widget _control() => Container(
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
              child: widget.shimmer
                  ? Shimmer.fromColors(
                      baseColor: widget.baseColor,
                      highlightColor: widget.highlightedColor,
                      child: widget.label,
                    )
                  : widget.label,
            ),
            Dismissible(
              key: Key("cancel"),
              direction: DismissDirection.startToEnd,

              ///gives direction of swipping in argument.
              onDismissed: (dir) {
                setState(() {
                  if (widget.dismissible) {
                    flag = false;
                  } else {
                    flag = !flag;
                  }
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
              ),
            ),
          ],
        ),
      );
}
