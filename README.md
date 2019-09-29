# Slider Button


A package provides an easy implementation of a Slider Button to cancel current transaction or screen.
Highly customizable iphone alike looking widget.

<p>
    <img src="https://github.com/anirudhsharma392/Slider-Button/blob/master/screenshots/button.gif"/>

</p>

## How to use

```dart
import 'package:slider_button/slider_button.dart';

```

```dart
Center(child: SliderButton(
      action: () {
        ///Do something here
        Navigator.of(context).pop();
      },
       label: Text(
          "Slide to cancel Event",
          style: TextStyle(
              color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 17),
        ),
      icon: Text(
        "x",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 44,
        ),
      ),


    ));

```
