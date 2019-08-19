import 'package:flutter/material.dart';

class RoundRectChip extends StatelessWidget{

  final String label;
  final bool selected;
  final double borderRadius;
  final Color labelColor;
  final Color selectColor;
  final Color borderColor;
  final onPressed;

  RoundRectChip({
    this.label,
    this.selected,
    this.borderRadius,
    this.labelColor = Colors.black,
    this.selectColor,
    this.borderColor = Colors.black,
    this.onPressed,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 87,
      height: 45,
      child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: FlatButton(
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(label,style: TextStyle(color: labelColor,fontSize: 11))),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          color: selectColor,
          onPressed: onPressed,
        ),
      )
    );
  }
}