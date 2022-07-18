
import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';

import '../../models/cities.dart';

class CityListTileWidget extends StatefulWidget {


  final City country;
  final bool isNative;
  final bool isSelected;
  final ValueChanged<City> onSelectedCountry;

    const CityListTileWidget({Key? key,

    required this.country,
    required this.isNative,
    required this.isSelected,
    required this.onSelectedCountry,
  }) : super(key: key) ;

  @override
  State<CityListTileWidget> createState() => _CityListTileWidgetState();
}

class _CityListTileWidgetState extends State<CityListTileWidget> {
  @override
  Widget build(BuildContext context) {
    const selectedColor = AppTheme.textOrange;
    final style = widget.isSelected
        ? const TextStyle(
      fontSize: 18,
      color: selectedColor,
      fontWeight: FontWeight.bold,
    )
        : const TextStyle(fontSize: 18);

    return ListTile(
      onTap: () => widget.onSelectedCountry(widget.country),

      title: Text(
         widget.country.name,
        style: style,
      ),
      trailing:
      widget.isSelected ?const  Icon(Icons.check, color: selectedColor, size: 26) : null,
    );
  }
}