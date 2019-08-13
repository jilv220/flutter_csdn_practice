import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TipRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    String text = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar : AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
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
