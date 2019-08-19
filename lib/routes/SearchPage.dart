import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/RoundRectChip.dart';

class SearchPage extends SearchDelegate<String> {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Text("搜索"),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RoundRectChip(label: "程序人生",selected: false, borderRadius: 10),
                  Container(
                    width: 10,
                  ),
                  RoundRectChip(label: "人工智能",selected: false, borderRadius: 10),
                  Container(
                    width: 10,
                  ),
                  RoundRectChip(label: "大数据",selected: false, borderRadius: 10),
                  Container(
                    width: 10,
                  ),
                  RoundRectChip(label: "区块链",selected: false, borderRadius: 10),
                  Container(
                    width: 10,
                  ),
                ],
              )
            ],
          )
        ),
      ],
    );
  }


  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context);
  }
}