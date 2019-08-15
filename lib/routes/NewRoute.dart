import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/JokeModel.dart';
import 'package:flutter_app/widgetFragment/JavaFragment.dart';
import 'package:flutter_app/widgetFragment/ProgramFragment.dart';
import 'package:flutter_app/widgetFragment/PythonFragment.dart';
import 'package:flutter_app/widgetFragment/RecommendFragment.dart';

class MainRoute extends StatefulWidget {
  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> with SingleTickerProviderStateMixin {

  TabController _tabController;
  JokeModel _jokeModel;
  List tabs = ["推荐","关注","程序人生","Python","Java"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length,vsync: this);   //ticker must be init in initState()
    loadRecommend();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: ConstrainedBox(constraints: BoxConstraints(maxHeight: 30,maxWidth: 300),
          child: TextField(
            decoration: InputDecoration(
                hintText: "搜索博文/帖子/用户",
                hintStyle: TextStyle(
                  fontSize: 15,
                ),
                prefixIcon: Icon(
                  Icons.search ,
                  size: 18,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))
                ),
            ),
          ),
        ),
        bottom:  PreferredSize(
            child: TabBar(
              isScrollable: true,
              tabs: tabs.map((element) => Tab(text: element,)).toList(),
              controller: _tabController,
              indicatorColor: Colors.red,
            ),
            preferredSize: Size.fromHeight(40)
        ),
        actions: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 20, 0),child: ImageIcon(AssetImage("assets/Icons/2dCode.png")),)  // 2dCode
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          RecommendFragment(jokeModel: _jokeModel),
          Text("haha"),
          ProgramFragment(),
          PythonFragment(),
          JavaFragment(),
        ],
      ),
    );
  }

  void loadRecommend() async {

    Response response;
    Dio dio = new Dio();
    response = await dio.post("https://api.apiopen.top/getJoke",data: {"type": "text", "page" : "1", "count" : "20"});
    //print(response.toString());
    Map<String,dynamic> json = jsonDecode(response.toString());

    setState(() {
      _jokeModel = JokeModel.fromJson(json);
    });

  }
}