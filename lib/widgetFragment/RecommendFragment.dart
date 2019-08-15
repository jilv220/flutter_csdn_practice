import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/JokeModel.dart';

class RecommendFragment extends StatefulWidget {
  @override
  _RecommendFragmentState createState() => _RecommendFragmentState();
}

class _RecommendFragmentState extends State<RecommendFragment> {

  JokeModel _jokeModel;
  bool isLoadMore = false;
  ScrollController _scrollController = new ScrollController(keepScrollOffset: true);

  var numItems = 20 ;
  final _titleSize = const TextStyle(fontSize: 18);
  final _subSize = const TextStyle(fontSize: 12);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {

      //pullToLoadMore
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
    loadData();
  }

  @override
  Widget build(BuildContext context) {

    var actualItem = numItems * 2;

    Widget _buildRow(int i) {
      return ListTile(
        title: Text(_jokeModel.result[i].name,style: _titleSize),
        subtitle: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(_jokeModel.result[i].text,style: _subSize),
        ),
      );
    }

    Widget _buildPlaceholder(int i) {
      return ListTile(
        title: Text("加载中...",style: _titleSize,textAlign: TextAlign.center),
        subtitle: Text("",style: _subSize),
      );
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: loadData,
        child: Scrollbar(
            child: ListView.builder(
              itemCount: actualItem ,
              padding: EdgeInsets.all(4.0),
              itemBuilder: (BuildContext context, int i) {
                if (_jokeModel != null && i.isEven) {
                  return _buildRow(i ~/ 2);
                } else if (i.isOdd){
                  return Divider();
                } else {
                  return _buildPlaceholder(i);
                }
              },
              controller: _scrollController,
            ),
        ),
      ),
    );
  }

  Future loadData() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.post("https://api.apiopen.top/getJoke",data: {"type": "text", "page" : "1", "count" : "20"});
    //print(response.toString());
    Map<String,dynamic> json = jsonDecode(response.toString());

    setState(() {
      _jokeModel = JokeModel.fromJson(json);  // setState load data, or the data will not be saved
    });
  }

  Future loadMore() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.post("https://api.apiopen.top/getJoke",data: {"type": "text", "page" : "1", "count" : "10"});
    //print(response.toString());
    Map<String,dynamic> json = jsonDecode(response.toString());

    if (!isLoadMore) {
      setState(() => isLoadMore = true);

      setState(() {
        numItems += 5;// setState load data, or the data will not be saved
        _jokeModel.result.addAll(JokeModel.fromJson(json).result);
        isLoadMore = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}