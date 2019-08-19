import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/RoundRectChip.dart';
import 'package:path/path.dart';

class SearchPage extends SearchDelegate<String> {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      GestureDetector(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 15, 0),
          child: Text("搜索", style: TextStyle(fontSize: 18)),
        ),
        onTap: () => this.showResults(context),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.pink,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {   // must not return null !!!!

    const searchList = [
      "lao-老王",
      "lao-老张",
      "xiao-小王",
      "xiao-小张"
    ];

    const recentSuggest = [
      "马云-1",
      "马化腾-2"
    ];

    final suggestionList = query.isEmpty?
    recentSuggest :searchList.where((input) => input.startsWith(query)).toList();

    List<String> chipConfig1 = ["程序人生","人工智能","大数据","区块链"];
    List<String> chipConfig2 = ["数据库","游戏开发","计算机基础","研发管理"];
    List<String> chipConfig3 = ["前端","移动开发","编程语言","框架"];
    List<String> chipConfig4 = ["运维","物联网","音视频开发","安全"];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "热门搜索",
                      style: TextStyle(fontSize: 17)
                  ),
                  Container(
                    height: 10,
                  ),
                  buildChips(context, chipConfig1),
                  buildChips(context, chipConfig2),
                  buildChips(context, chipConfig3), 
                  buildChips(context, chipConfig4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          "搜索历史",
                          style: TextStyle(fontSize: 17)
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      FlatButton(
                        child: Text(
                            "全部清空",
                            style:TextStyle(fontSize: 15)),
                        onPressed: () {

                        },
                      ),
                    ],
                  )
                ],
              )
          ),
        ],
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context);
  }

  void onPressed(BuildContext context, List<String> labels, int index) {
    query = labels[index];
    this.showResults(context);
  }

  Widget buildChips(BuildContext context, List<String> labels) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RoundRectChip(
            label: labels[0],
            selected: false,
            borderRadius: 10,
            labelColor: Color(0xff0000FF),
            borderColor: Color(0xffE6E6FA),
            selectColor: Color(0xffF0F8FF),
            onPressed: (){
              onPressed(context, labels, 0);
            }),
        Container(
          width: 10,
        ),
        RoundRectChip(
            label: labels[1],
            selected: false,
            borderRadius: 10,
            labelColor: Color(0xff0000FF),
            borderColor: Color(0xffE6E6FA),
            selectColor: Color(0xffF0F8FF),
            onPressed: (){
              onPressed(context, labels, 1);
            }),
        Container(
          width: 10,
        ),
        RoundRectChip(
            label: labels[2],
            selected: false,
            borderRadius: 10,
            labelColor: Color(0xff0000FF),
            borderColor: Color(0xffE6E6FA),
            selectColor: Color(0xffF0F8FF),
            onPressed: (){
              onPressed(context, labels, 2);
            }),
        Container(
          width: 10,
        ),
        RoundRectChip(
            label: labels[3],
            selected: false,
            borderRadius: 10,
            labelColor: Color(0xff0000FF),
            borderColor: Color(0xffE6E6FA),
            selectColor: Color(0xffF0F8FF),
            onPressed: (){
              onPressed(context, labels, 3);
            }),
        Container(
          width: 10,
        ),
      ],
    );
  }
}
