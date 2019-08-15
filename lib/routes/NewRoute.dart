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
                hintText: "搜索",
                hintStyle: TextStyle(
                  fontSize: 15,
                ),
                prefixIcon: Icon(
                  Icons.search ,
                  size: 25,
                ),
                contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                )
            ),
          ),
        ),
        bottom:  PreferredSize(
            child: TabBar(
              tabs: tabs.map((element) => Tab(text: element,)).toList(),
              controller: _tabController,
              indicatorColor: Colors.red,
            ),
            preferredSize: Size.fromHeight(40)),
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