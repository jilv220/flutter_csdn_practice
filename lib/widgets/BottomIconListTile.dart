import 'package:flutter/material.dart';

class BottomIconListTile extends StatelessWidget {

  final String titleContent;
  final TextStyle titleStyle;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry subtitlePadding;
  final EdgeInsetsGeometry iconPadding;
  final String subtitleContent;
  final TextStyle subtitleStyle;
  final List<Widget> bottomIconContent;
  final onTap;


  BottomIconListTile ({
    this.titleContent,
    this.titleStyle,
    this.contentPadding,
    @required this.iconPadding,
    @required this.subtitlePadding,
    this.subtitleContent = "",
    this.subtitleStyle = const TextStyle(),
    this.bottomIconContent = const <Widget>[],
    this.onTap,
});

  Widget build(BuildContext context) {

    return GestureDetector(
      child: ListTile(
        title: Text(titleContent,style: titleStyle),
        contentPadding: contentPadding,
        subtitle: Padding(
            padding: subtitlePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(subtitleContent,style: subtitleStyle),
                Padding(
                  padding: iconPadding,
                  child: Row(
                    children: bottomIconContent,
                  ),
                )
              ],
            )
        ),
      ),
      onTap: onTap,
    );
  }
}
