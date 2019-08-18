import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/frameworkDart/ViewModelProvider.dart';
import 'package:flutter_app/viewModel/ProgramFragmentViewModel.dart';
import 'package:flutter_app/viewModel/RecommendFragmentViewModel.dart';
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
  List tabs = ["推荐","关注","程序人生","Python","Java"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length,vsync: this);   //ticker must be init in initState()
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
          ViewModelProvider(
            viewModel: RecommendFragmentViewModel(),
            child: RecommendFragment(),
          ),
          Text("haha"),
          ViewModelProvider(
              viewModel: ProgramFragmentViewModel(),
              child: ProgramFragment(),
          ),
          PythonFragment(),
          JavaFragment(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}