import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlignRoute extends StatelessWidget {

  var firstHeight = 120.0;
  var firstWidth = 120.0;
  var childSize = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("what"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Container(
              child: Text("Hello world",style: TextStyle(color: Colors.white)),
              color: Colors.red,
              key: Key("what"),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text("I am Jack hhhhh"),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );

  }
}