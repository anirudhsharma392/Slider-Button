import 'dart:ui';

import 'package:flutter/material.dart';

import 'widgets/cancel_event_slider.dart';
import 'widgets/power_off_slider.dart';
import 'widgets/slide_to_cancel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainApp());
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildGreyBackground(),
          _buildGlassOverlay(),
          _buildSliders(),
        ],
      ),
    );
  }

  Widget _buildGreyBackground() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xff2C2C2E),
              Color(0xff1C1C1E),
              Color(0xff000000),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlassOverlay() {
    return Positioned.fill(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            color: Color(0xff1C1C1E).withOpacity(0.4),
          ),
        ),
      ),
    );
  }

  Widget _buildSliders() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PowerOffSlider(),
          SizedBox(height: 28),
          Center(child: CancelEventSlider()),
          SizedBox(height: 28),
          SlideToCancelSlider(),
        ],
      ),
    );
  }
}
