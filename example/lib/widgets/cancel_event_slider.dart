import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

/// "Slide to cancel Event" slider button with translucent styling.
class CancelEventSlider extends StatelessWidget {
  const CancelEventSlider({
    super.key,
    this.onSlide,
  });

  /// Called when the user completes the slide. Return true to dismiss.
  final Future<bool> Function()? onSlide;

  @override
  Widget build(BuildContext context) {
    return SliderButton(
      action: () async {
        debugPrint("Power Killed!");
        final result = await onSlide?.call();
        return result ?? true;
      },
      label: Text(
        "Slide to kill power!",
        style: TextStyle(
          color: Color(0xff4a4a4a),
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
      icon: Center(
        child: Icon(
          CupertinoIcons.power,
          color: Colors.redAccent,
          size: 30.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.25),
      buttonColor: Colors.white.withOpacity(0.4),
      boxShadow: BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 4,
      ),
    );
  }
}
