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
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: buildSearchBar(context),
        automaticallyImplyLeading: false,
        titleSpacing: -10,
        leading: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context)
          )
        ),
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Text("搜索", style: TextStyle(fontSize: 18)),
            ),
            onTap: () {

              setState(() {
                widget.recentSuggest.add(controller.text);
              });
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
      leading: Padding(
        padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
        child: Icon(Icons.search,
            color: Colors.grey,
            size: 18
        ),
      ),
      trailing: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 21),
        child: Icon(Icons.close,
            color: Colors.grey,
            size: 18
        ),
      ),
      titleContent: widget.recentSuggest[i],
      titleStyle: TextStyle(fontSize: 15, color: Colors.grey),
      subtitlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      onTap: () {
        controller.text = widget.recentSuggest[i];
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
                            style: TextStyle(
                                fontSize: 17
                            )
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        FlatButton(
                          child: Text(
                              "全部清空",
                              style:TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey
                              )
                          ),
                          onPressed: () {

                            setState(() {
                              widget.recentSuggest.clear();
                              widget.recentSuggest.add("placeholder");
                            });

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
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: 50,
              maxWidth: 300
          ),
          child: TextField(
            controller: controller,
            onSubmitted: (String content) {
              setState(() {
                widget.recentSuggest.add(content);
                //go to result
              });
            },
            autofocus: true,
            decoration: InputDecoration(
              hintText: "",
              hintStyle: TextStyle(
                fontSize: 23,
              ),
              filled: true,
              fillColor: Color(0xffF0F8FF),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
              contentPadding: EdgeInsets.symmetric(vertical: 4.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),
            ),
          )
      ),
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

    controller.text = labels[index];
    setState(() {
      widget.recentSuggest.add(labels[index]);
    });
    //go to result
  }
}
