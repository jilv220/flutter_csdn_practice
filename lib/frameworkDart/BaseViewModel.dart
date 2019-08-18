import 'package:flutter/material.dart';

abstract class BaseViewModel {

  bool _isFirst = true;
  bool get isFirst => _isFirst;

  @mustCallSuper
  void init(BuildContext context) {
     if(_isFirst) {
       _isFirst = false;
       doInit(context);
     }
  }

  @protected
  Future refreshData();

  @protected
  void doInit(BuildContext context);

  void dispose();
}