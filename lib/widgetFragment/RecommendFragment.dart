import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/builder/ListViewBuilder.dart';
import 'package:flutter_app/model/JokeModel.dart';
import 'package:flutter_app/net/NetRequest.dart';
import 'package:flutter_app/net/NetRequestEnum.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class RecommendFragment extends StatefulWidget {
  @override
  _RecommendFragmentState createState() => _RecommendFragmentState();
}

class _RecommendFragmentState extends State<RecommendFragment> with AutomaticKeepAliveClientMixin{

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

    loadImage();
    loadData();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {

    Widget _swiperBuilder(BuildContext context, int index) {
      return imageList[index];
    }

    Widget _buildBanner() {
      return Container(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          child: Swiper(
            itemBuilder: _swiperBuilder, //配置滑动
            itemCount: 3,
            pagination: new SwiperPagination(
                builder: RectSwiperPaginationBuilder(
                  color: Colors.black54,
                  activeColor: Colors.white,
                )),
            control: new SwiperControl(
              iconPrevious: null,    //配置前后翻页icon
              iconNext: null,
            ),
            scrollDirection: Axis.horizontal,
            autoplay: true,
            onTap: (index) => print('点击了第$index个'),
          ));
    }

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
                    buildPlaceholder: _buildPlaceholder,
                    buildBanner: _buildBanner);
              },
              controller: _scrollController,
            ),
        ),
      ),
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

  Widget _buildPlaceholder(int i) {
    return ListTile(
      title: Text("加载中...",style: _titleSize,textAlign: TextAlign.center),
      subtitle: Text("",style: _subSize),
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

  Future refreshData() async {

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

  void loadImage() {
    imageList.add(Image.network(
        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
        fit: BoxFit.fill));
    imageList.add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
        fit: BoxFit.fill));
    imageList.add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
        fit: BoxFit.fill));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}