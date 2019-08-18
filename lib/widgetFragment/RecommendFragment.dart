import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/builder/ListViewBuilder.dart';
import 'package:flutter_app/frameworkDart/ViewModelProvider.dart';
import 'package:flutter_app/model/JokeModel.dart';
import 'package:flutter_app/viewModel/RecommendFragmentViewModel.dart';
import 'package:flutter_app/widgets/BottomIconListTile.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class RecommendFragment extends StatefulWidget {
  @override
  _RecommendFragmentState createState() => _RecommendFragmentState();
}

class _RecommendFragmentState extends State<RecommendFragment> with AutomaticKeepAliveClientMixin{

  ScrollController _scrollController = new ScrollController();
  RecommendFragmentViewModel _viewModel;

  final _titleSize = const TextStyle(fontSize: 18);
  final _subSize = const TextStyle(fontSize: 12);
  List<Widget> imageList = List();
  List<Widget> tileList = List();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {

      //pullToLoadMore
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _viewModel.loadMore(10);
      }
    });

    initListTile();
    initImage();
    _viewModel = ViewModelProvider.of(context);
    _viewModel.doInit(context);
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {

   // print("build!");

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
      body: StreamBuilder(
          stream: _viewModel.dataStream,
          builder: (BuildContext context, AsyncSnapshot<JokeModel> snapshot) {

            if(!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            return RefreshIndicator(
              onRefresh: _viewModel.refreshData,
              child: Scrollbar(
                child: ListView.separated(
                  itemCount: _viewModel.numItems,
                  padding: EdgeInsets.all(4.0),
                  separatorBuilder: (BuildContext context, int i) {
                    if (i > 1) {
                      return Divider(color: Colors.grey);
                    } else {
                      return Divider(height: 0.0);
                    }
                  },
                  itemBuilder: (BuildContext context, int i) {

                    return ListViewBuilder<JokeModel>()
                        .build(i, snapshot,
                        buildRow: _buildRow,
                        buildBanner: _buildBanner);
                  },
                  controller: _scrollController,
                ),
              ),
            );
          }
      )
    );
  }

  Widget _buildRow(int i, AsyncSnapshot<JokeModel> snapshot) {
    return BottomIconListTile(
      titleContent: snapshot.data.result[i].name,
      titleStyle: _titleSize,
      subtitleContent: snapshot.data.result[i].text,
      subtitleStyle: _subSize,
      subtitlePadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      iconPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      bottomIconContent: tileList,
    );
  }

  void initListTile() {

    tileList = [Icon(Icons.account_circle),
    Container(
    width: 5,
    height: 10,
    ),
    Text("玉米地最菜码农"),
    Container(
    width: 18,
    height: 10,
    ),
    Text("8月16日"),
    Container(
    width: 18,
    height: 10,
    ),
    Icon(Icons.remove_red_eye),
    Container(
    width: 5,
    height: 10,
    ),
    Text("0"),
    Container(
    width: 18,
    height: 10,
    ),
    Text("评论 0")];
  }

  void initImage() {
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
    _viewModel.dispose();
    _scrollController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}