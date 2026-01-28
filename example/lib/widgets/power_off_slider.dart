import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

/// iOS-style "slide to power off" slider button.
class PowerOffSlider extends StatelessWidget {
  const PowerOffSlider({
    super.key,
    this.onSlide,
  });

  /// Called when the user completes the slide. Return true to dismiss.
  final Future<bool> Function()? onSlide;

  @override
  Widget build(BuildContext context) {
    return SliderButton(
      action: () async {
        debugPrint("Power off action");
        final result = await onSlide?.call();
        return result ?? false;
      },
      label: Text(
        "slide to power off",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
      icon: Icon(
        CupertinoIcons.power,
        color: Color(0xffFF3B30),
        size: 28,
      ),
      width: 260,
      height: 62,
      buttonSize: 56,
      radius: 30,
      backgroundColor: Color(0xff5A7278).withOpacity(0.45),
      useGlassEffect: true,
      glassBlurSigma: 24,
      glassBorderColor: Colors.white.withOpacity(0.35),
      glassBorderWidth: 0.7,
      buttonColor: Colors.white,
      highlightedColor: Colors.white.withOpacity(0.9),
      alignLabel: const Alignment(0.5, 0),
      shimmer: true,
      vibrationFlag: true,
      dismissThresholds: 0.7,
      boxShadow: BoxShadow(
        color: Colors.black.withOpacity(0.12),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    );
  }
}
