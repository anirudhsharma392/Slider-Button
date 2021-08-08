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
            child: Container(
      // color: Colors.amberAccent,
      child: SliderButton(
        value: false,
        action: (state) {
          ///Do something here OnSlide
          print("working");
          print(state);
        },
        disable: false,
        dismissible: false,

        ///Put label over here
        // label: Text(
        //   "Slide to cancel !",
        //   style: TextStyle(
        //     color: Color(0xff4a4a4a),
        //     fontWeight: FontWeight.w500,
        //     fontSize: 17,
        //   ),
        // ),
        shimmer: true,
        onIcon: Icon(
          Icons.power_settings_new,
          color: Colors.white,
          size: 40.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
        offIcon: Icon(
          Icons.ac_unit,
          color: Colors.white,
          size: 40.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),

        //Put BoxShadow here
        boxShadow: BoxShadow(
          color: Colors.black,
          blurRadius: 4,
        ),

        //Adjust effects such as shimmer and flag vibration here
        // shimmer: true,
        vibrationFlag: true,

        ///Change All the color and size from here.
        width: 230,
        radius: 50,
        onButtonColor: Colors.orange.shade800,
        offButtonColor: Colors.grey.shade500,
        offBackgroundColor: Colors.grey.shade300,
        onBackgroundColor: Colors.orange.shade500,
        onHighlightedColor: Colors.white,
        offHighlightedColor: Colors.white,
        onBaseColor: Colors.black,
        offBaseColor: Colors.black54,
      ),
    )));
  }
}
