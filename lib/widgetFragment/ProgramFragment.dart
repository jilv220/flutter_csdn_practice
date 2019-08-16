import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/frameworkDart/BaseListViewFragment.dart';

class ProgramFragment extends StatefulWidget {
  @override
  _ProgramFragmentState createState() => _ProgramFragmentState();
}

class _ProgramFragmentState extends State<ProgramFragment>
    with AutomaticKeepAliveClientMixin
    implements BaseListViewFragment{

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

  @override
  void loadData() {

  }

  @override
  void loadImage() {

  }

  @override
  Future loadMore(int item) {

    return null;
  }

  @override
  Future refreshData() {

    return null;
  }

  @override
  Widget buildPlaceholder(int i) {

    return null;
  }

  @override
  Widget buildRow(int i) {

    return null;
  }

  @override
  bool get wantKeepAlive => true;

}