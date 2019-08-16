import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseListViewFragment {

  ScrollController _scrollController;

  Widget build(BuildContext context) {

    return Scaffold();
  }


  Widget buildRow(int i) {
    return ListTile();
  }

  Widget buildPlaceholder(int i) {
    return ListTile();
  }

  Future refreshData() async {

  }

  void loadData() {

  }

  Future loadMore(int item) async {

  }
}