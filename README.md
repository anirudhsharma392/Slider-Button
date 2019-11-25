# Slider Button
![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)

This package provides an easy implementation of a Slider Button to cancel current transaction or screen.
Highly customizable iphone alike looking widget.

<p>
    <img src="https://github.com/anirudhsharma392/Slider-Button/blob/master/screenshots/button_3.gif?raw=true"/>

</p>

## How to use
### Type 1
This is a Circle type widget.
You just need to define the border radius to swap between rectangle and circle type widget.

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
### Type 2

This is a Rectangle type widget.

<p>
    <img src="https://github.com/anirudhsharma392/Slider-Button/blob/master/screenshots/button_2.gif?raw=true"/>

</p>

```dart
import 'package:slider_button/slider_button.dart';

```

```dart
SliderButton(
      action: () {
        ///Do something here OnSlide
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

      ///Change All the color and size from here.
      width: 230,
      radius: 10,
      buttonColor: Color(0xffd60000),
      backgroundColor: Color(0xff534bae),
      highlightedColor: Colors.white,
      baseColor: Colors.red,
    );
```

## Custom Usage
There are several options that allow for more control:

|  Properties  |   Default   |   Description   |
|--------------|-----------------|--------------|
| `action` | null | (required) Define an action after slidding a button |
| `vibrationFlag` | true | controls vibration on successful dismissed |
| `height` | 60 | Gives a height to a widget |
| `width` | 240 | Gives a width to a widget |
| `backgroundColor` | Color(0xffececec) | Gives a background color to a widget |
| `baseColor` | Color(0xff4a4a4a) | Gives a shimmer base color to a widget |
| `highlightedColor` | Colors.white | Gives a shimmer highlighted color  to a widget |
| `buttonColor` | Colors.black | Gives a color to a slidder button |
| `label` | Text("Slide to cancel !", style: TextStyle( fontSize: 17),) | A text widget which assigns a label. |
| `alignLabel` | Alignment(0.4, 0) | Aligns text label |
| `boxShadow` | BoxShadow(color: Colors.black,blurRadius: 4,) | Gives a shadow to a slidder button |
| `icon` | Center( child: Icon( Icons.power_settings_new,color: Colors.white,size: 40.0,)) | A widget to provide an icon to a button |
| `shimmer` | true | enables/disables shimmer effect on the label |
| `dismissible` | true | Make it false if you want maintain the widget in the tree |
| `buttonSize` | 60 | Gives size to a button |

<br>
<br>


# 👍 Contribution
1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -m 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
