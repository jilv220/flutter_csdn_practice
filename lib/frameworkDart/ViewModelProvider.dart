import 'package:flutter/material.dart';
import 'BaseViewModel.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatefulWidget {

  final T viewModel;
  final Widget child;

  const ViewModelProvider({
    Key key,
    @required this.viewModel,
    @required this.child
  }) : super(key: key);

  static T of <T extends BaseViewModel>(BuildContext context) {
    final type = _typeOf<ViewModelProvider<T>>();
    ViewModelProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.viewModel;
  }

  static Type _typeOf<T>() => T;

  @override
  _ViewModelProviderState createState() => _ViewModelProviderState();
}

class _ViewModelProviderState extends State<ViewModelProvider> {
  @override
  Widget build(BuildContext context) {

    return widget.child;
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }
}