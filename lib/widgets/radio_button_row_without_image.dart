
import 'package:flutter/material.dart';

import '../Utils/app_theme.dart';

class RadioButtonRowWithoutImage extends StatefulWidget {
  const RadioButtonRowWithoutImage({Key? key}) : super(key: key);

  @override
  State<RadioButtonRowWithoutImage> createState() => _RadioButtonRowWithoutImageState();
}

enum menuitem { item1, item2, item3, item4 }

class _RadioButtonRowWithoutImageState extends State<RadioButtonRowWithoutImage> {
  @override
  Widget build(BuildContext context) {
    menuitem? _mitem = menuitem.item1;
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListTile(
              minVerticalPadding: 0,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              horizontalTitleGap: 0,
              dense: true,
              title: const Text('Prix négociable'),
              leading: Radio<menuitem>(
                activeColor: AppTheme.radioButtonColor,
                value: menuitem.item1,
                groupValue: _mitem,
                onChanged: (menuitem? value) {
                  setState(() {
                    _mitem = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              minVerticalPadding: 0,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              horizontalTitleGap: 0,
              dense: true,
              title: const Text('Prix final'),
              leading: Radio<menuitem>(
                value: menuitem.item2,
                activeColor: AppTheme.radioButtonColor,
                groupValue: _mitem,
                onChanged: (menuitem? value) {
                  setState(() {
                    _mitem = value;
                  });
                },
              ),
            ),
          ),
        ],),);
  }
}
