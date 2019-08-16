import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/builder/ListViewBuilder.dart';
import 'package:flutter_app/model/JokeModel.dart';
import 'package:flutter_app/net/NetRequest.dart';
import 'package:flutter_app/net/NetRequestEnum.dart';

class JavaFragment extends StatefulWidget {
  @override
  _JavaFragmentState createState() => _JavaFragmentState();
}

class _JavaFragmentState extends State<JavaFragment>
    with AutomaticKeepAliveClientMixin {

  JokeModel _jokeModel;
  bool isLoadMore = false;
  ScrollController _scrollController = new ScrollController();

  var numItems = 20 ;
  final _titleSize = const TextStyle(fontSize: 18);
  final _subSize = const TextStyle(fontSize: 12);
  List<Widget> imageList = List();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {

      //pullToLoadMore
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        loadMore(10);
      }
    });

    loadData();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: Scrollbar(
          child: ListView.builder(
            itemCount: numItems ,
            padding: EdgeInsets.all(4.0),
            itemBuilder: (BuildContext context, int i) {

              return ListViewBuilder.build(i, _jokeModel,
                  buildRow: _buildRow,
                  buildPlaceholder: _buildPlaceholder);
            },
            controller: _scrollController,
          ),
        ),
      ),
    );
  }

  void loadData() {

    Map<String,String> params = {"type": "text", "page" : "1", "count" : "$numItems"};

    NetRequest.post(NetRequestEnum.GET_JOKES, params,

        onSuccess:(response) {

          setState(() {
            _jokeModel = JokeModel.fromJson(response);  // setState load data, or the data will not be saved
          });
        },
        onFailure:(error) {});
  }

  Future loadMore(int item) async {

    Map<String,String> params = {"type": "text", "page" : "1", "count" : "10"};

    NetRequest.post(NetRequestEnum.GET_JOKES, params,

        onSuccess:(response) {

          if (!isLoadMore) {

            setState(() {
              numItems += item;// setState load data, or the data will not be saved
              _jokeModel.result.addAll(JokeModel.fromJson(response).result);
              isLoadMore = false;
            });
          }
        },
        onFailure:(error) {});
  }


  Future refreshData() async{

    Map<String,String> params = {"type": "text", "page" : "1", "count" : "$numItems"};

    NetRequest.post(NetRequestEnum.GET_JOKES, params,

        onSuccess:(response) {

          setState(() {
            _jokeModel = JokeModel.fromJson(response);  // setState load data, or the data will not be saved
            numItems = 20;    // reset the numItems
          });
        },
        onFailure:(error) {});
  }


  Widget _buildPlaceholder(int i) {
    return ListTile(
      title: Text("加载中...",style: _titleSize,textAlign: TextAlign.center),
      subtitle: Text("",style: _subSize),
    );
  }

  Widget _buildRow(int i) {

    return ListTile(
      title: Text(_jokeModel.result[i].name,style: _titleSize),
      subtitle: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Text(_jokeModel.result[i].text,style: _subSize),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}