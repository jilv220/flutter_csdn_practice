import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/builder/ListItemBuilder.dart';
import 'package:flutter_app/frameworkDart/ViewModelProvider.dart';
import 'package:flutter_app/model/JokeModel.dart';
import 'package:flutter_app/viewModel/JokeFragmentViewModel.dart';
import 'package:flutter_app/widgets/BottomIconListTile.dart';

class PythonFragment extends StatefulWidget {
  @override
  _PythonFragmentState createState() => _PythonFragmentState();
}

class _PythonFragmentState extends State<PythonFragment>
    with AutomaticKeepAliveClientMixin {

  ScrollController _scrollController = new ScrollController();
  JokeFragmentViewModel _viewModel;

  final _titleSize = const TextStyle(fontSize: 18);
  final _subSize = const TextStyle(fontSize: 12);
  List<Widget> imageList = List();
  List<Widget> tileList = List();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {

      //pullToLoadMore
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _viewModel.loadMore(10);
      }
    });

    initListTile();
    _viewModel = ViewModelProvider.of(context);
    _viewModel.init(context);
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {

    return Scaffold(
        body: StreamBuilder(
            stream: _viewModel.dataStream,
            builder: (BuildContext context, AsyncSnapshot<JokeModel> snapshot) {

              if(!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              return RefreshIndicator(
                onRefresh: _viewModel.refreshData,
                child: Scrollbar(
                  child: ListView.separated(
                    itemCount: _viewModel.numItems,
                    padding: EdgeInsets.all(4.0),
                    separatorBuilder: (BuildContext context, int i) {
                      if (i > 1) {
                        return Divider(color: Colors.grey);
                      } else {
                        return Divider(height: 0.0);
                      }
                    },
                    itemBuilder: (BuildContext context, int i) {

                      return ListItemBuilder<JokeModel>().build(i, snapshot, buildRow: _buildRow);
                    },
                    controller: _scrollController,
                  ),
                ),
              );
            }
        )
    );
  }

  Widget _buildRow(int i, AsyncSnapshot<JokeModel> snapshot) {
    return BottomIconListTile(
      titleContent: snapshot.data.result[i].name,
      titleStyle: _titleSize,
      subtitleContent: snapshot.data.result[i].text,
      subtitleStyle: _subSize,
      subtitlePadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      iconPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      bottomIconContent: tileList,
    );
  }

  void initListTile() {

    tileList = [Icon(Icons.account_circle),
      Container(
        width: 5,
        height: 10,
      ),
      Text("玉米地最菜码农"),
      Container(
        width: 18,
        height: 10,
      ),
      Text("8月16日"),
      Container(
        width: 18,
        height: 10,
      ),
      Icon(Icons.remove_red_eye),
      Container(
        width: 5,
        height: 10,
      ),
      Text("0"),
      Container(
        width: 18,
        height: 10,
      ),
      Text("评论 0")];
  }


  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
    _scrollController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}