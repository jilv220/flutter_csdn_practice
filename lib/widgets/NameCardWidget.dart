import 'package:flutter/material.dart';

class NameCardWidget extends StatelessWidget {

  final double height;
  final double width;
  final String name;
  final String nameExt;
  final TextStyle nameExtStyle;
  final TextStyle nameStyle;
  final double namePadding;
  final String title;
  final TextStyle titleStyle;
  final double titlePadding;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final EdgeInsetsGeometry buttonPadding;
  final ShapeBorder shapeBorder;
  final onPressed;
  final BoxDecoration decoration;

  NameCardWidget({
    @required this.height,
    @required this.width,
    @required this.name,
    this.nameStyle,
    this.title,
    this.titleStyle,
    @required this.buttonText,
    this.buttonTextStyle,
    @required this.shapeBorder,
    @required this.onPressed,
    @required this.namePadding,
    @required this.titlePadding,
    @required this.buttonPadding,
    @required this.decoration,
    this.nameExt,
    this.nameExtStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: namePadding,
          ),
          Text.rich(TextSpan(
              children: [
                TextSpan(text: name, style: nameStyle),
                TextSpan(text: nameExt, style: nameExtStyle),
              ]
          )),
          Container(
            height: titlePadding,
          ),
          Text(title, style: titleStyle),
          Padding(
            padding: buttonPadding,
            child: Container(
              height: 30,
              child: FlatButton(
                child: Text(buttonText, style: buttonTextStyle),
                shape: shapeBorder,
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
      decoration: decoration,
    );
  }
}
