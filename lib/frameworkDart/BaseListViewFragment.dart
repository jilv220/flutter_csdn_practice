import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseListViewFragment {

  ScrollController _scrollController;

  Widget build(BuildContext context) {

    Widget _buildRow(int i) {
      return ListTile();
    }

    Widget _buildPlaceholder(int i) {
      return ListTile();
    }

    return Scaffold();
  }

  Future refreshData() async {

  }

  void loadData() {

  }

  Future loadMore(int item) async {

  }

  void loadImage() {

  }
}