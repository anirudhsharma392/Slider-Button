# Slider Button


This package provides an easy implementation of a Slider Button to cancel current transaction or screen.
Highly customizable iphone alike looking widget.



## How to use
#Type1

<p>
    <img src="https://github.com/anirudhsharma392/Slider-Button/blob/master/screenshots/button_1.gif?raw=true"/>

</p>

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
## Type 2
<p>
    <img src="https://github.com/anirudhsharma392/Slider-Button/blob/master/screenshots/button_2.gif?raw=true"/>

</p>
```dart
SliderButton(
      action: () {
        ///Do something here

      },

       label: Text(
          "Slide to cancel Match",
          style: TextStyle(
              color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 17),
        ),
      icon: Center(
      child:Icon(   Icons.power_settings_new,
                    color: Colors.white,
                    size: 40.0,
                     semanticLabel: 'Text to announce in accessibility modes',
                               )),

      buttonColor: Colors.blue,
      backgroundColor: Colors.green,
      highlightedColor: Colors.red,
      baseColor: Colors.amber,


    );
    ```