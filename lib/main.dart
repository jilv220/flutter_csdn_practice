import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/routes/AlignRoute.dart';
import 'package:flutter_app/routes/CupertinoRoute.dart';
import 'package:flutter_app/routes/NewRoute.dart';
import 'package:flutter_app/routes/SwitchAndCheckBoxTestRoute.dart';
import 'package:flutter_app/routes/TipRoute.dart';
import 'package:flutter_app/widgetFragment/EntertainFragment.dart';
import 'package:flutter_app/widgetFragment/HistoryFragment.dart';
import 'package:flutter_app/widgetFragment/NewsFragment.dart';

//main 之前可以自定义异常捕获
void main() => runApp(MyApp());
String text = "我是参数";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      routes: {
        "/": (context) => MyHomePage(),
        "new_page" : (context) => NewRoute(),
        "tip_page" : (context) => TipRoute(),
        "cupertino_page" : (context) => CupertinoRoute(),
        "switch_and_checkbox_test_page" : (context) => SwitchAndCheckBoxTestRoute(),
        "align_route_page" :(context) => AlignRoute(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  List tabs = ["新闻","娱乐","历史"];
  List<Tab> tabList = [];
  List<Container> tabViews = [];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length,vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: ConstrainedBox(constraints: BoxConstraints(maxHeight: 30),
          child: TextField(
            decoration: InputDecoration(
            labelText: "  搜索",
            labelStyle: TextStyle(
              fontSize: 15,
            ),
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))
            )
            ),
        ),
        ),
        bottom: TabBar(
          tabs: tabs.map((element) => Tab(text: element,)).toList(),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:<Widget> [
          NewsFragment(),
          EntertainFragment(),
          HistoryFragment(),
        ]
      ),
    );
  }
}
