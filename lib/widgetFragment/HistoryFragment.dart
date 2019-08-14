import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistoryFragment extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          child: Text("Hello world",style: TextStyle(color: Colors.white)),
          color: Colors.red,
        ),
      ],
    );
  }
}