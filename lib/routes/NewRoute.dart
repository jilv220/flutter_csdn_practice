import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewRoute extends StatefulWidget {
  @override
  _NewRouteState createState() => _NewRouteState();
}


class _NewRouteState extends State<NewRoute> with SingleTickerProviderStateMixin {

  TabController _tabController;
  List tabs = ["新闻","娱乐","历史"];

  @override
  Widget build(BuildContext context) {

    _tabController = TabController(length: tabs.length,vsync: this);

    return Scaffold(
      appBar: AppBar(
        title: Text ("new route"),
        bottom: TabBar(
          tabs: tabs.map((element) => Tab(text: element,)).toList(),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Text("haha"),
          Text("haha"),
          Text("haha"),
        ],
      ),
    );

  }
}