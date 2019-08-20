import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/BottomIconListTile.dart';
import 'package:flutter_app/widgets/RoundRectChip.dart';

class SearchRoute extends StatefulWidget{

  final List recentSuggest;

  SearchRoute({
    this.recentSuggest,
  });

  @override
  State<StatefulWidget> createState() {
    return SearchRouteState();
  }
}

class SearchRouteState extends State<SearchRoute> {

  List<String> chipConfig1 = ["程序人生","人工智能","大数据","区块链"];
  List<String> chipConfig2 = ["数据库","游戏开发","计算机基础","研发管理"];
  List<String> chipConfig3 = ["前端","移动开发","编程语言","框架"];
  List<String> chipConfig4 = ["运维","物联网","音视频开发","安全"];

  String query;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: buildSearchBar(context),
        automaticallyImplyLeading: false,
        leading: Icon(Icons.arrow_back_ios),
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 15, 0),
              child: Text("搜索", style: TextStyle(fontSize: 18)),
            ),
            onTap: () {
              widget.recentSuggest.add(query);
              //go to result
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.recentSuggest.length ,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0 && buildBanner != null) {
            return buildBanner(context);
          } else {
            return buildRow(context,index);
          }
        },
      )
    );
  }

  Widget buildRow(BuildContext context,int i) {
    return BottomIconListTile(
      titleContent: widget.recentSuggest[i],
      titleStyle: TextStyle(fontSize: 15),
      subtitlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      onTap: () {
        query = widget.recentSuggest[i];
        // go to resultPage
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
                            widget.recentSuggest.clear();
                            widget.recentSuggest.add("placeholder");
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

  Widget buildSearchBar(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: 30,
            maxWidth: 300
        ),
        child: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: "",
            hintStyle: TextStyle(
                fontSize: 15,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 4.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))
            ),
          ),
        )
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

  void onPressed(BuildContext context, List<String> labels, int index) {
    query = labels[index];
    widget.recentSuggest.add(labels[index]);     //add label to recentSuggest List
    //go to result
  }
}
