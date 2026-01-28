import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

/// "Slide to cancel !" slider button with purple track and red thumb.
class SlideToCancelSlider extends StatelessWidget {
  const SlideToCancelSlider({
    super.key,
    this.onSlide,
  });

  /// Called when the user completes the slide. Return true to dismiss.
  final Future<bool> Function()? onSlide;

  @override
  Widget build(BuildContext context) {
    return SliderButton(
      action: () async {
        debugPrint("Button 3 action");
        final result = await onSlide?.call();
        return result ?? true;
      },
      label: Text(
        "Slide to cancel !",
        style: TextStyle(
          color: Color(0xff4a4a4a),
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
      icon: Center(
        child: Icon(
          CupertinoIcons.power,
          color: Colors.white,
          size: 40.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
      ),
      boxShadow: BoxShadow(
        color: Colors.black,
        blurRadius: 4,
      ),
      shimmer: true,
      vibrationFlag: true,
      width: 230,
      radius: 10,
      buttonColor: Color(0xffd60000).withOpacity(0.9),
      backgroundColor: Color(0xff534bae).withOpacity(0.75),
      highlightedColor: Colors.white,
      baseColor: Colors.red,
    );
  }
}
