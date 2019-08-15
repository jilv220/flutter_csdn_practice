import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PythonFragment extends StatefulWidget {
  @override
  _PythonFragmentState createState() => _PythonFragmentState();

}

class _PythonFragmentState extends State<PythonFragment> {

  @override
  Widget build(BuildContext context) {

    final numItems = 20 ;
    final _titleSize = const TextStyle(fontSize: 18);
    final _subSize = const TextStyle(fontSize: 12);

    Widget _buildRow(int id) {
      return ListTile(
        title: Text("dio",style: _titleSize),
        subtitle: Text("jojo",style: _subSize),
      );
    }

    return ListView.builder(
        itemCount: numItems,
        padding: EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) return Divider();
          return _buildRow(i);
        });
  }
}