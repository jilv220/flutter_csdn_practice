import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/frameworkDart/ViewModelProvider.dart';
import 'package:flutter_app/viewModel/JokeFragmentViewModel.dart';
import 'package:flutter_app/widgetFragment/JavaFragment.dart';
import 'package:flutter_app/widgetFragment/ProgramFragment.dart';
import 'package:flutter_app/widgetFragment/PythonFragment.dart';
import 'package:flutter_app/widgetFragment/RecommendFragment.dart';
import 'SearchRoute.dart';

class MainRoute extends StatefulWidget {
  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> with SingleTickerProviderStateMixin {

  TabController _tabController;
  List tabs = ["推荐","关注","程序人生","Python","Java"];
  List recentSuggest;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length,vsync: this);//ticker must be init in initState()
    recentSuggest = ["JOJO", "DIO", "Bruno", "Felix"];  //load data
    recentSuggest.insert(0, "placeholder");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildSearchBar(context),
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
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 20, 0),child: ImageIcon(AssetImage("assets/Icons/2dCode.png")),)  // 2dCode
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

  Widget buildSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 33, maxWidth: 400),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 330,
              height: 33,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xffF0F8FF),
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
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return SearchRoute(recentSuggest: recentSuggest);
                            }));
                          }
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

}



