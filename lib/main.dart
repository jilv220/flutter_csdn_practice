import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/routes/AlignRoute.dart';
import 'package:flutter_app/routes/CupertinoRoute.dart';
import 'package:flutter_app/routes/MainRoute.dart';
import 'package:flutter_app/routes/SearchRoute.dart';
import 'package:flutter_app/routes/SwitchAndCheckBoxTestRoute.dart';
import 'package:flutter_app/routes/TipRoute.dart';

//main 之前可以自定义异常捕获
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      routes: {
        "/": (context) => MyHomePage(),
        "new_page" : (context) => MainRoute(),
        "tip_page" : (context) => TipRoute(),
        "cupertino_page" : (context) => CupertinoRoute(),
        "switch_and_checkbox_test_page" : (context) => SwitchAndCheckBoxTestRoute(),
        "align_route_page" :(context) => AlignRoute(),
        "search_page" :(context) => SearchRoute(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;

  final List<BottomNavigationBarItem> bottomNavItems = [
    new BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/Icons/MainPage.png")),
      title: Text("首页"),
    ),
    new BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/Icons/Study.png")),
      title: Text("学习"),
    ),
    new BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/Icons/Blink.png")),
      title: Text("Blink"),
    ),
    new BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/Icons/Forum.png")),
      title: Text("论坛"),
    ),
    new BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text("我的"),
    )];

  final List<Widget> pages = [
    MainRoute(),
    TipRoute(),
    AlignRoute(),
    CupertinoRoute(),
    SwitchAndCheckBoxTestRoute()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: null,
      body: IndexedStack(
        children: pages,
        index: _currentIndex,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items:bottomNavItems,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
        },
      ),
    );
  }
}
