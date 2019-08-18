import 'package:flutter/material.dart';
import 'package:flutter_app/frameworkDart/BaseViewModel.dart';
import 'package:flutter_app/model/JokeModel.dart';
import 'package:flutter_app/net/NetRequest.dart';
import 'package:flutter_app/net/NetRequestEnum.dart';
import 'package:rxdart/rxdart.dart';

class ProgramFragmentViewModel extends BaseViewModel {

  var numItems = 20;
  var isLoadMore = false;
  JokeModel jokeModel;

  BehaviorSubject<JokeModel> _dataObservable = BehaviorSubject();
  Stream<JokeModel> get dataStream => _dataObservable.stream;

  @override
  void dispose() {
    _dataObservable.close();
  }

  @override
  void doInit(BuildContext context) {
    refreshData();
  }

  @override
  Future refreshData() async {

    Map<String,String> params = {"type": "text", "page" : "1", "count" : "20"};
    NetRequest.post(NetRequestEnum.GET_JOKES, params,

        onSuccess:(response) {
          jokeModel = JokeModel.fromJson(response);
          //print(jokeModel.result.length);
          _dataObservable.add(jokeModel);
        },
        onFailure:(error) {});
  }

  Future loadMore(int item) async {

    Map<String,String> params = {"type": "text", "page" : "1", "count" : "$item"};

    NetRequest.post(NetRequestEnum.GET_JOKES, params,

        onSuccess:(response) {

          if (!isLoadMore) {

            numItems += item;// setState load data, or the data will not be saved
            //print("$numItems");
            jokeModel.result.addAll(JokeModel.fromJson(response).result);
            _dataObservable.add(jokeModel);
            isLoadMore = false;
          }
        },
        onFailure:(error) {});
  }
}