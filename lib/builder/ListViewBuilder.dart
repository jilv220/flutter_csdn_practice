import 'package:flutter/material.dart';
import 'package:flutter_app/model/JokeModel.dart';

class ListViewBuilder {

  static Widget build(int index,JokeModel model,{buildPlaceholder(int index), buildRow(int index), buildBanner()}) {

    if (index == 0 && buildBanner != null) {
      return buildBanner();
    } else if (index == 1) {
      return Divider(height: 0.0);
    }
    else if (model != null && index.isEven) {
      return buildRow(index);
    } else if (index.isOdd && index != 1){
      return Divider();
    } else {
      return buildPlaceholder(index);
    }
  }
}