import 'package:flutter/material.dart';

import 'shimmer.dart';

class SliderButton extends StatefulWidget {
  final double height;
  final double width;
  final Text label;
  final Color backgroundColor;
  final Alignment alignLabel;
  final Widget icon;
  final Function action;

  SliderButton({
    @required this.action,
    this.height = 60,
    this.width = 260,
    this.alignLabel = const Alignment(0.4, 0),
    this.backgroundColor = const Color(0xffececec),
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
                borderRadius: BorderRadius.circular(100)),
            alignment: Alignment.centerLeft,
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: widget.alignLabel,
                  child: Shimmer.fromColors(
                    baseColor: Color(0xff4a4a4a),
                    highlightColor: Theme.of(context).canvasColor,
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
                            new BoxShadow(
                              color: Colors.black54,
                              blurRadius: 2,
                            ),
                          ],
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: widget.icon,
                      ),
                    )),
              ],
            ))
        : Container();
  }
}
