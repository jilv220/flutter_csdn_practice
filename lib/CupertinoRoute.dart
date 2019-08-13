import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

class CupertinoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("cupertino demo"),
      ),
      child: Center(
        child: CupertinoButton(child: Text("Press"),
            onPressed: (){}),
      ),
    );
  }

}