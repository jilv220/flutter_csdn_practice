import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/builder/ListViewBuilder.dart';
import 'package:flutter_app/model/JokeModel.dart';
import 'package:flutter_app/net/NetRequest.dart';
import 'package:flutter_app/net/NetRequestEnum.dart';
import 'package:flutter_app/widgets/BottomIconListTile.dart';

class ProgramFragment extends StatefulWidget {
  @override
  _ProgramFragmentState createState() => _ProgramFragmentState();
}

class _ProgramFragmentState extends State<ProgramFragment>
    with AutomaticKeepAliveClientMixin {

  JokeModel _jokeModel;
  bool isLoadMore = false;
  ScrollController _scrollController = new ScrollController();

  var numItems = 20 ;
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
        loadMore(10);
      }
    });

    initListTile();
    loadData();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: Scrollbar(
          child: ListView.builder(
            itemCount: numItems ,
            padding: EdgeInsets.all(4.0),
            itemBuilder: (BuildContext context, int i) {

              return ListViewBuilder.build(i, _jokeModel,
                  buildRow: _buildRow,
                  buildPlaceholder: _buildPlaceholder);
            },
            controller: _scrollController,
          ),
        ),
      ),
    );
  }

  void loadData() {

    Map<String,String> params = {"type": "text", "page" : "1", "count" : "$numItems"};

    NetRequest.post(NetRequestEnum.GET_JOKES, params,

        onSuccess:(response) {

          setState(() {
            _jokeModel = JokeModel.fromJson(response);  // setState load data, or the data will not be saved
          });
        },
        onFailure:(error) {});
  }

  Future loadMore(int item) async {

    Map<String,String> params = {"type": "text", "page" : "1", "count" : "10"};

    NetRequest.post(NetRequestEnum.GET_JOKES, params,

        onSuccess:(response) {

          if (!isLoadMore) {

            setState(() {
              numItems += item;// setState load data, or the data will not be saved
              _jokeModel.result.addAll(JokeModel.fromJson(response).result);
              isLoadMore = false;
            });
          }
        },
        onFailure:(error) {});
  }


  Future refreshData() async{

    Map<String,String> params = {"type": "text", "page" : "1", "count" : "$numItems"};

    NetRequest.post(NetRequestEnum.GET_JOKES, params,

        onSuccess:(response) {

          setState(() {
            _jokeModel = JokeModel.fromJson(response);  // setState load data, or the data will not be saved
            numItems = 20;    // reset the numItems
          });
        },
        onFailure:(error) {});
  }


  Widget _buildPlaceholder(int i) {
    return ListTile(
      title: Text("加载中...",style: _titleSize,textAlign: TextAlign.center),
      subtitle: Text("",style: _subSize),
    );
  }

  Widget _buildRow(int i) {

    return BottomIconListTile(
      titleContent: _jokeModel.result[i].name,
      titleStyle: _titleSize,
      subtitleContent: _jokeModel.result[i].text,
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
  bool get wantKeepAlive => true;

}