import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/JokeModel.dart';

class RecommendFragment extends StatefulWidget {
  final JokeModel jokeModel;

  RecommendFragment({@required this.jokeModel});

  @override
  _RecommendFragmentState createState() => _RecommendFragmentState();

}

class _RecommendFragmentState extends State<RecommendFragment> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final numItems = 20 ;
    final _titleSize = const TextStyle(fontSize: 18);
    final _subSize = const TextStyle(fontSize: 12);

    Widget _buildRow(int i) {
      return ListTile(
        title: Text(widget.jokeModel.result[i].name,style: _titleSize),
        subtitle: Text(widget.jokeModel.result[i].text,style: _subSize),
      );
    }
    Widget _buildPlaceholder(int i) {
      return ListTile(
        title: Text("加载中...",style: _titleSize,textAlign: TextAlign.center),
        subtitle: Text("",style: _subSize),
      );
    }

    return ListView.builder(
        itemCount: numItems,
        padding: EdgeInsets.all(4.0),
        itemBuilder: (BuildContext context, int i) {
          if (widget.jokeModel != null) {
            return _buildRow(i);
          } else {
            return _buildPlaceholder(i);
          }
        });
  }
}