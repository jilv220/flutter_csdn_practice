import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("new route"),
      ),
      body: Center(
        child: Text("This is a new route"),
      ),
    );
  }
}