import 'package:flutter/material.dart';


class SliderWidget extends StatelessWidget {
 // const SliderWidget({Key? key}) : super(key: key);

  final Color? activeColor;
  final Color? inactiveColor;
  final RangeValues selectedRange;
  final RangeLabels rangeLabels;
  final int? divisions;
  final double minRange;
  final double maxRange;
  final Function(RangeValues)? onChanged;

  const SliderWidget({Key? key,
    required this.activeColor,
    required this.inactiveColor,
    required this.selectedRange,
    required this.rangeLabels,
    required this.divisions,
    required this.minRange,
    required this.maxRange,
    required this.onChanged
}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data:  const SliderThemeData(
          trackHeight: 1,

        ), child: RangeSlider(


        activeColor: activeColor,
        inactiveColor: inactiveColor,
        values: selectedRange,
        labels: RangeLabels('${selectedRange.start}', '${selectedRange.end}'),
        divisions: divisions,
        min: minRange,
        max: maxRange,
        onChanged: onChanged,
    ));
  }
}
