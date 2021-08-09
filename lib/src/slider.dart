import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
// import 'package:slider_button/src/vibration.dart';

import 'shimmer.dart';

class SliderButton extends StatefulWidget {
  ///To make button more customizable add your child widget
  final Widget? child;

  ///Sets the radius of corners of a button.
  final double radius;

  ///Use it to define a height and width of widget.
  final double height;
  final double width;
  final double buttonSize;

  ///Use it to define a color of widget.
  final Color onBackgroundColor;
  final Color offBackgroundColor;
  final Color onBaseColor;
  final Color offBaseColor;
  final Color onHighlightedColor;
  final Color offHighlightedColor;
  final Color onButtonColor;
  final Color offButtonColor;

  ///Change it to gave a label on a widget of your choice.
  final Text? onlabel, offlabel;
  TextStyle _textStyle = TextStyle(
    color: Color(0xff4a4a4a),
    fontWeight: FontWeight.w500,
    fontSize: 17,
  );

  ///Gives a alignment to a slider icon.
  final Alignment alignLabel;
  final BoxShadow? boxShadow;
  final Widget? offIcon, onIcon;
  final Function action;

  ///Make it false if you want to deactivate the shimmer effect.
  // This is enabled by default
  final bool shimmer;

  ///Make it false if you want maintain the widget in the tree.
  final bool dismissible;

  final bool? vibrationFlag;

  ///The offset threshold the item has to be dragged in order to be considered
  ///dismissed e.g. if it is 0.4, then the item has to be dragged
  /// at least 40% towards one direction to be considered dismissed
  final double dismissThresholds;

  /// value of the button as a switch
  /// The defualt value for the switch is false
  final bool value;

  final bool disable;
  SliderButton({
    required this.action,
    this.radius = 100,
    this.boxShadow,
    this.child,
    this.vibrationFlag = false,
    this.shimmer = true,
    this.height = 70,
    this.buttonSize = 60,
    this.width = 250,
    this.alignLabel = const Alignment(0.4, 0),
    this.onBackgroundColor = Colors.greenAccent,
    this.offBackgroundColor = const Color(0xffe0e0e0),
    this.onBaseColor = Colors.black87,
    this.offBaseColor = Colors.black54,
    this.onButtonColor = Colors.green,
    this.offButtonColor = Colors.grey,
    this.onHighlightedColor = Colors.white,
    this.offHighlightedColor = Colors.white,
    this.onlabel = const Text('Slide On',
        style: TextStyle(
          color: Color(0xff4a4a4a),
          fontWeight: FontWeight.w500,
          fontSize: 17,
        )),
    this.offlabel = const Text('Slide Off',
        style: TextStyle(
          color: Color(0xff4a4a4a),
          fontWeight: FontWeight.w500,
          fontSize: 17,
        )),
    this.offIcon,
    this.onIcon,
    this.dismissible = true,
    this.dismissThresholds = 1.0,
    this.disable = false,
    this.value = true,
  }) : assert(buttonSize <= height);

  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  bool? flag;
  late bool state;

  @override
  void initState() {
    super.initState();
    flag = true;
    state = widget.value ? true : false;
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

  Widget _control() {
    DismissDirection _direction =
        state ? DismissDirection.endToStart : DismissDirection.startToEnd;
    Map<DismissDirection, double> _dismissThresholds = state
        ? {DismissDirection.endToStart: widget.dismissThresholds}
        : {DismissDirection.startToEnd: widget.dismissThresholds};

    // DismissDirection _direction = DismissDirection.endToStart;
    // Map<DismissDirection, double> _dismissThresholds = {
    //   DismissDirection.endToStart: widget.dismissThresholds
    // };
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.disable
            ? Colors.grey.shade700
            : state
                ? widget.onBackgroundColor
                : widget.offBackgroundColor,
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      alignment: Alignment.centerLeft,
      child: Stack(
        alignment: state ? Alignment.centerRight : Alignment.centerLeft,
        children: <Widget>[
          Container(
            alignment:
                state ? Alignment(-widget.alignLabel.x, 0) : widget.alignLabel,
            child: widget.shimmer && !widget.disable
                ? Shimmer.fromColors(
                    baseColor: widget.disable
                        ? Colors.grey
                        : state
                            ? widget.onBaseColor
                            : widget.offBaseColor,
                    highlightColor: state
                        ? widget.onHighlightedColor
                        : widget.offHighlightedColor,
                    child: state ? widget.offlabel! : widget.onlabel!,
                    direction:
                        state ? ShimmerDirection.rtl : ShimmerDirection.ltr,
                  )
                : state
                    ? widget.offlabel!
                    : widget.onlabel!,
          ),
          widget.disable
              ? Tooltip(
                  verticalOffset: 50,
                  message: 'Button is disabled',
                  child: Container(
                    width: (widget.width) - (widget.height),
                    height: (widget.height - 70),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: (widget.height - widget.buttonSize) / 2,
                    ),
                    child: widget.child ??
                        Container(
                          height: widget.buttonSize,
                          width: widget.buttonSize,
                          decoration: BoxDecoration(
                              boxShadow: [
                                widget.boxShadow!,
                              ],
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.circular(widget.radius)),
                          child: Center(child: widget.offIcon),
                        ),
                  ),
                )
              : Dismissible(
                  key: Key("cancel"),
                  direction: _direction,
                  dismissThresholds: _dismissThresholds,

                  onResize: () async {
                    if (widget.vibrationFlag! &&
                        (await Vibration.hasVibrator())!) {
                      try {
                        Vibration.vibrate(duration: 100);
                      } catch (e) {
                        print(e);
                      }
                    }
                  },

                  confirmDismiss: _handleSwipeOnly,

                  ///gives direction of swipping in argument.
                  onDismissed: _handleSwipeAndDismiss,

                  child: Container(
                    width: (widget.width) - (widget.height),
                    height: widget.height,
                    alignment:
                        state ? Alignment.centerRight : Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: (widget.height - widget.buttonSize) / 2,
                      right: (widget.height - widget.buttonSize) / 2,
                    ),
                    child: widget.child ??
                        Container(
                          height: widget.buttonSize,
                          width: widget.buttonSize,
                          decoration: BoxDecoration(
                              boxShadow: [
                                widget.boxShadow!,
                              ],
                              color: state
                                  ? widget.onButtonColor
                                  : widget.offButtonColor,
                              borderRadius:
                                  BorderRadius.circular(widget.radius)),
                          child: Center(
                              child: state ? widget.offIcon : widget.onIcon),
                        ),
                  ),
                ),
          // Container(
          //   child: SizedBox.expand(),
          // ),
        ],
      ),
    );
  }

  Future<bool?> _handleSwipeOnly(DismissDirection dir) async {
    if (widget.dismissible) return true;

    // Vibrate, if vibrationFlag is true and the device supports vibration
    if (widget.vibrationFlag! && (await Vibration.hasVibrator())!) {
      try {
        Vibration.vibrate(duration: 200);
      } catch (e) {
        print(e);
      }
    }
    widget.action(!state);
    setState(() {
      flag = !flag!;
      state = !state;
    });

    return false;
  }

  Future<bool?> _handleSwipeAndDismiss(DismissDirection dir) async {
    // Vibrate, if vibrationFlag is true and the device supports vibration
    if (widget.vibrationFlag! && (await Vibration.hasVibrator())!) {
      try {
        Vibration.vibrate(duration: 200);
      } catch (e) {
        print(e);
      }
    }
    //  Execute the actions callback
    widget.action(!state);
    // set the state of the widget
    setState(() {
      flag = false;
      state = !state;
    });
  }
}
