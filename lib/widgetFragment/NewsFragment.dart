import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsFragment extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment:Alignment.center ,
      children: <Widget>[
        Container(
          child: Text("Hello world",style: TextStyle(color: Colors.white)),
          color: Colors.red,
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(10),
          child: Text("I am Jack hhhhh"),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text("Your friend"),
        )
      ],
    );
  }
}
