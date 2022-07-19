import 'package:flutter/material.dart';

import '../Utils/app_theme.dart';


class RadioButtonRow extends StatefulWidget {
  const RadioButtonRow({Key? key}) : super(key: key);

  @override
  State<RadioButtonRow> createState() => _RadioButtonRowState();
}

class _RadioButtonRowState extends State<RadioButtonRow> {
  int id = 1;
  @override
  Widget build(BuildContext context) {
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
              title: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Image.asset('assets/icons/pickupIcon.png',
                          width: IconTheme.of(context).size,
                          height: IconTheme.of(context).size),
                    ),
                  ),
                  const Flexible(
                    flex: 2,
                    child: Text(
                      "À récupérer",
                      style: TextStyle(color: AppTheme.checkboxLabelColor,fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              leading:
              Radio(
                activeColor: AppTheme.textOrange,
                value: 1,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    id = 1;
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
              title: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Image.asset('assets/icons/deliveryIcon.png',
                          width: IconTheme.of(context).size,
                          height: IconTheme.of(context).size),
                    ),
                  ),
                  const Flexible(
                    flex: 2,
                    child: Text(
                      "À Livrer",
                      style: TextStyle(color: AppTheme.checkboxLabelColor,fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              leading:
              Radio(
                activeColor: AppTheme.textOrange,
                value: 2,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    id = 2;
                  });
                },
              ),
            ),
          ),
        ],),);
  }
}
