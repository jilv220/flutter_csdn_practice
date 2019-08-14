import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SwitchAndCheckBoxTestRoute extends StatefulWidget {

  @override
  createState() => new _SwitchAndCheckBoxRouteState();
}

class _SwitchAndCheckBoxRouteState extends State<SwitchAndCheckBoxTestRoute> {

  bool _switchSelected = true;
  bool _checkBoxSelected = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Column(
        children: <Widget>[
          Switch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() => _switchSelected = value);
            },
          ),
          Checkbox(
            value: _checkBoxSelected,
            onChanged: (value) {
              setState(() => _checkBoxSelected = value);
            },
          )
        ],
      ),
    );
  }
}