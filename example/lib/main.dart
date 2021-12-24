import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

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
        body: Center(
            child: SliderButton(
      action: () {
        ///Do something here OnSlide
        print("working");
      },
      ///Put label over here
      label: Text(
        "Slide to cancel !",
        style: TextStyle(
            color: Color(0xff4a4a4a),
            fontWeight: FontWeight.w500,
            fontSize: 17),
      ),
      icon: Center(
          child: Icon(
        Icons.power_settings_new,
        color: Colors.white,
        size: 40.0,
        semanticLabel: 'Text to announce in accessibility modes',
      )),

      //Put BoxShadow here
      boxShadow: BoxShadow(
        color: Colors.black,
        blurRadius: 4,
      ),

      //Adjust effects such as shimmer and flag vibration here
      shimmer: true,
      vibrationFlag: true,

      ///Change All the color and size from here.
      width: 230,
      radius: 10,
      buttonColor: Color(0xffd60000),
      backgroundColor: Color(0xff534bae),
      highlightedColor: Colors.white,
      baseColor: Colors.red,
    )));
  }
}
