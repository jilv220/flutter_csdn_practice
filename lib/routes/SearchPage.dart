import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/BottomIconListTile.dart';
import 'package:flutter_app/widgets/RoundRectChip.dart';
import 'package:rxdart/rxdart.dart';

class SearchPage extends SearchDelegate<String> {

  //模拟数据
  var recentSuggest;

  SearchPage({
    this.recentSuggest,
});

  List<String> chipConfig1 = ["程序人生","人工智能","大数据","区块链"];
  List<String> chipConfig2 = ["数据库","游戏开发","计算机基础","研发管理"];
  List<String> chipConfig3 = ["前端","移动开发","编程语言","框架"];
  List<String> chipConfig4 = ["运维","物联网","音视频开发","安全"];

  // ignore: close_sinks
  BehaviorSubject<List<String>> dataObservable = BehaviorSubject();
  Stream<List<String>> dataStream;

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
  Widget buildSuggestions(BuildContext context) {// must not return null !!

    return StreamBuilder(
      stream: dataStream,
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {

        return ListView.builder(
          itemCount: recentSuggest.length ,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0 && buildBanner != null) {
              return buildBanner(context);
            } else {
              return buildRow(context,index);
            }
          },
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context);
  }

  void onPressed(BuildContext context, List<String> labels, int index) {
    query = labels[index];
    recentSuggest.add(labels[index]);
    this.showResults(context);
  }

  Widget buildRow(BuildContext context,int i) {
    return BottomIconListTile(
      titleContent: recentSuggest[i],
      titleStyle: TextStyle(fontSize: 15),
      subtitlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      onTap: () {
        query = recentSuggest[i];
        this.showResults(context);
      },
    );
  }

  Widget buildBanner(BuildContext context) {
    return Column(
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
                            recentSuggest.clear();
                            recentSuggest.add("placeholder");
                            dataObservable.add(recentSuggest);
                          },
                        ),
                      ],
                    )
                  ]
              )
          ),
        ]
    );
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
