import 'package:flutter/material.dart';

class ListItemBuilder<T> {

  // ignore: missing_return
  Widget build(int index,AsyncSnapshot<T> snapshot,{buildRow(int index,AsyncSnapshot<T> snapshot), buildBanner()}) {

    if (index == 0 && buildBanner != null) {
      return buildBanner();
    } else if (index == 1) {
      return Divider(height: 0.0);
    }
    else if (snapshot.hasData) {
      return buildRow(index,snapshot);
    }
  }
}