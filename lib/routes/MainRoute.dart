import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/frameworkDart/ViewModelProvider.dart';
import 'package:flutter_app/viewModel/JokeFragmentViewModel.dart';
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
        title: ConstrainedBox(constraints: BoxConstraints(maxHeight: 35,maxWidth: 400),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 330,
                height: 35,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xffE6E6FA),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 10,
                      ),
                      Icon(Icons.search),
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 4, 0, 4),
                          child: Text(
                            "搜索博文/帖子/用户",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey
                            ),
                          ),
                        ),
                        onTap: () => Navigator.pushNamed(context, "align_route_page"),
                      ),
                    ],
                  )
                ),
              ),
            ],
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
            viewModel: JokeFragmentViewModel(),
            child: RecommendFragment(),
          ),
          Text("haha"),
          ViewModelProvider(
              viewModel: JokeFragmentViewModel(),
              child: ProgramFragment(),
          ),
          ViewModelProvider(
            viewModel: JokeFragmentViewModel(),
            child: PythonFragment(),
          ),
          ViewModelProvider(
            viewModel: JokeFragmentViewModel(),
            child: JavaFragment(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    JokeFragmentViewModel().dataObservable.close();
    _tabController.dispose();
  }
}