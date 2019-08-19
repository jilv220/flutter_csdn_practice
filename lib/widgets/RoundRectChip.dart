import 'package:flutter/material.dart';

class RoundRectChip extends StatelessWidget{

  final String label;
  final bool selected;
  final double borderRadius;

  RoundRectChip({
    this.label,
    this.selected,
    this.borderRadius
});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
        label: Text(label),
        selected: selected,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius),
            )
        )
    );
  }
}