import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TipRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar : AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("haha"),
              RaisedButton(
                onPressed: () => Navigator.pop(context,"我是返回值"), // navigator.pop 返回之前route
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
